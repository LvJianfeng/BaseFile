//
//  NSString+Validate.h
//  SystemXinDai
//
//  Created by LvJianfeng on 16/4/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)
/**
 *  验证数字
 */
- (BOOL)validateNumber;

/**
 *  验证身份证号
 */
- (BOOL)validateIdNumber;

/**
 *  严格验证身份证号
 */
- (BOOL)validateIdNumberStrict;

/**
 *  验证邮箱
 */
- (BOOL)validateEmail;

/**
 *  验证手机号（11位纯数字）
 */
- (BOOL)validateMobilePhone;

/**
 *  验证电话号码号码:格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
 */
- (BOOL)validateTelephone;

/**
 *  验证电话号码或者手机号码
 */
- (BOOL)validatePhone;

/**
 *  验证密码：以字母开头，长度在6-18之间，只能包含字符、数字和下划线
 */
- (BOOL)validatePassword;
@end
