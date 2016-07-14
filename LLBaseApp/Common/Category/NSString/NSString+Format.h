//
//  NSString+Format.h
//  SystemXinDai
//
//  Created by LvJianfeng on 16/4/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Format)
/**
 *  手机号码 138****1381
 */
- (NSString *)formatMobilePhoneNumber;

/**
 *  电话号码 0218333****
 */
- (NSString *)formatTelePhoneNumber;
@end
