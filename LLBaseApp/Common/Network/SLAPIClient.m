//
//  SLAPIClient.m
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/9.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "SLAPIClient.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

@implementation SLAPIClient
/*
 * 单例
 */
+ (SLAPIClient *)shareManager{
    static SLAPIClient *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (manager==nil) {
            manager=[[SLAPIClient alloc] init];
        }
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.requestSerializer.timeoutInterval = 10;
    }
    return self;
}

- (void)requestGetWithURL:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(ReturnBlock)result failure:(FailureBlock)failure isConnect:(NetworkBlock)network isAuth:(BOOL)isAuth{
    //网络检测
    if (![self isConnectionAvailable]) {
        network(NO, nil);
        return;
    }
    //头信息配置
    
    //POST请求
    [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        result(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure([self getErrorCode:error], error);
    }];
}

- (void)requestPostWithURL:(NSString *)url parameters:(NSMutableDictionary *)parameters success:(ReturnBlock)result failure:(FailureBlock)failure isConnect:(NetworkBlock)network isAuth:(BOOL)isAuth{
    //网络检测
    if (![self isConnectionAvailable]) {
        network(NO, nil);
        return;
    }
    //头信息配置
    
    //是否授权
//    if (isAuth) {
//       [self.manager.requestSerializer setValue:[User getUserToken] forHTTPHeaderField:@"at"];
//    }else{
//       [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"at"];
//    }

    //POST请求
    NSString *path = [ll_sl_Server_Host stringByAppendingString:url];
    [self.manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject->%@",responseObject);
        result(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error->%@",error);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           [Utils writeErrorLogWithUrl:path error:error];
        });
        if (isAuth) {
            failure([self getErrorCode:error], error);
        }else{
            failure(@"网络请求超时", error);
        }
    }];
}

- (void)pageRequestPostWithURL:(NSString *)url startPage:(int)start parameters:(NSMutableDictionary *)parameters success:(ReturnBlock)result failure:(FailureBlock)failure isConnect:(NetworkBlock)network isAuth:(BOOL)isAuth{
    //网络检测
    if (![self isConnectionAvailable]) {
        network(NO, nil);
        return;
    }
    //分页
    [parameters setObject:[NSNumber numberWithInt:start] forKey:@"start"];
    [parameters setObject:@10 forKey:@"length"];
    
    //头信息配置
    
    //是否授权
//    if (isAuth) {
//        [self.manager.requestSerializer setValue:[User getUserToken] forHTTPHeaderField:@"at"];
//    }else{
//        [self.manager.requestSerializer setValue:@"" forHTTPHeaderField:@"at"];
//    }
    
    //POST请求
    NSString *path = [ll_sl_Server_Host stringByAppendingString:url];
    [self.manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject->%@",responseObject);
        result(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error->%@",error);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [Utils writeErrorLogWithUrl:path error:error];
        });
        if (isAuth) {
            failure([self getErrorCode:error], error);
        }else{
            failure(@"网络请求超时", error);
        }
    }];
}


- (BOOL)isConnectionAvailable {
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    //获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    //根据获得的连接标志进行判断
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

- (NSString *)getErrorCode:(NSError *)error{
    NSString *errorValue = error.userInfo[@"NSLocalizedDescription"];
    if (errorValue && errorValue.length>0) {
        NSRange range401 = [errorValue rangeOfString:@"401"];
        if (range401.location && range401.length) {
            return ll_sl_UnAuthorized;
        }
    }
    return @"网络请求超时";
}
@end
