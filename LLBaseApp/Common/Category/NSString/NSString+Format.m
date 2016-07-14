//
//  NSString+Format.m
//  SystemXinDai
//
//  Created by LvJianfeng on 16/4/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)
/**
 *  手机号码 138****1381
 */
- (NSString *)formatMobilePhoneNumber{
    return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
}

/**
 *  电话号码 0218333****
 */
- (NSString *)formatTelePhoneNumber{
    return [self stringByReplacingCharactersInRange:NSMakeRange(self.length-4, 4) withString:@"****"];
}
@end
