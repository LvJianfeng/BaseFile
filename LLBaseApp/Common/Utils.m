//
//  Utils.m
//  SystemXinDai
//
//  Created by LvJianfeng on 16/3/22.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "Utils.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

@implementation Utils
+ (BOOL)isConnectionAvailable {
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

+ (void)writeErrorLogWithUrl:(NSString *)url error:(NSError *)error{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"SLLog.plist"];   //获取路径
    NSFileManager* fm = [NSFileManager defaultManager];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if (![fm fileExistsAtPath:filename]) {
        [fm createFileAtPath:filename contents:nil attributes:nil];
    }else{
        //获取文件大小
        long long size = [[fm attributesOfItemAtPath:filename error:nil] fileSize];
        float fSize = size/(1024.0 * 1024.0);
        //文件大小在2MB内
        if (fSize<=2) {
            array = [[NSMutableArray alloc] initWithContentsOfFile:filename];
        }
    }
    NSMutableDictionary *logDict = [[NSMutableDictionary alloc] init];
    [logDict setObject:[[NSDate date] yyyyMMddByLineWithDate] forKey:@"Date"];
    [logDict setObject:url forKey:@"Url"];
    [logDict setObject:error.userInfo[@"NSLocalizedDescription"] forKey:@"Description"];
    [array addObject:logDict];
    
    [array writeToFile:filename atomically:YES];
}

+ (NSMutableArray *)readErrorLog{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"SLLog.plist"];
    NSFileManager* fm = [NSFileManager defaultManager];
    NSMutableArray *logArray = [[NSMutableArray alloc] init];
    if ([fm fileExistsAtPath:filename]) {
        logArray = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    }
    return logArray;
}
@end
