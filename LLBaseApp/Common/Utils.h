//
//  Utils.h
//  SystemXinDai
//
//  Created by LvJianfeng on 16/3/22.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config_Tools.h"
/**
 *  通用util
 */
@interface Utils : NSObject
/**
 *  判断当前网络状态
 *
 *  @return
 */
+ (BOOL)isConnectionAvailable;

/**
 *  写日志
 *
 *  @param errorCode 错误code
 *  @param url       请求url
 *  @param error     错误对象
 */
+ (void)writeErrorLogWithUrl:(NSString *)url error:(NSError *)error;

/**
 *  读取日志
 *
 *  @return 日志数组
 */
+ (NSMutableArray *)readErrorLog;
@end
