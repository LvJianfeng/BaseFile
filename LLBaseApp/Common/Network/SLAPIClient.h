//
//  SLAPIClient.h
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/9.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config_Tools.h"
//定义返回请求数据的block类型
typedef void (^ReturnBlock)(id value);
typedef void (^ErrorBlock)(id error);
typedef void (^FailureBlock)(NSString *errorMessage, id obj);
typedef void (^NetworkBlock)(BOOL isConnect, id obj);

#define APPKEY @"76fe6afa2b5786d8"

@interface SLAPIClient : NSObject
+ (SLAPIClient *)shareManager;

/**
 *  Get请求
 *
 *  @param url        地址
 *  @param parameters 参数
 *  @param result     成功
 *  @param failure    失败
 *  @param network    无网络
 *  @param isAuth     是否需要授权
 */
- (void)requestGetWithURL:(NSString *)url
                parameters:(NSMutableDictionary *)parameters
                   success:(ReturnBlock)result
                   failure:(FailureBlock)failure
                 isConnect:(NetworkBlock)network
                    isAuth:(BOOL)isAuth;

/**
 *  Post请求
 *
 *  @param url        地址
 *  @param parameters 参数
 *  @param result     成功
 *  @param failure    失败
 *  @param network    无网络
 *  @param isAuth     是否需要授权
 */
- (void)requestPostWithURL:(NSString *)url
                parameters:(NSMutableDictionary *)parameters
                   success:(ReturnBlock)result
                   failure:(FailureBlock)failure
                 isConnect:(NetworkBlock)network
                    isAuth:(BOOL)isAuth;

/**
 *  Post请求
 *
 *  @param url        地址
 *  @param start      起始页码
 *  @param parameters 参数
 *  @param result     成功
 *  @param failure    失败
 *  @param network    无网络
 *  @param isAuth     是否需要授权
 */
- (void)pageRequestPostWithURL:(NSString *)url
                     startPage:(int)start
                    parameters:(NSMutableDictionary *)parameters
                       success:(ReturnBlock)result
                       failure:(FailureBlock)failure
                     isConnect:(NetworkBlock)network
                        isAuth:(BOOL)isAuth;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end
