//
//  NSString+Validate.m
//  SystemXinDai
//
//  Created by LvJianfeng on 16/4/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

//验证数字
- (BOOL)validateNumber{
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *number = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [number evaluateWithObject:self];
}

//验证身份证号
- (BOOL)validateIdNumber{
    if (self.length!=18) {
        return NO;
    }
    NSString *regexIdNumber = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexIdNumber];
    return [identityCardPredicate evaluateWithObject:self];
}

//严格验证身份证号
- (BOOL)validateIdNumberStrict{
    if (self.length!=18) {
        return NO;
    }
    NSString *regexIdNumber = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexIdNumber];
    BOOL flag = [identityCardPredicate evaluateWithObject:self];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [self substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([self isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return flag;
            }else
            {
                flag =  NO;
                return flag;
            }
        }else
        {
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return flag;
            }
            else
            {
                flag =  NO;
                return flag;
            }
        }
    }else{
        return flag;
    }
}

//验证邮箱
- (BOOL)validateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *email = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [email evaluateWithObject:self];
}

//验证手机号码（11纯数字）
- (BOOL)validateMobilePhone{
    NSString *numberRegex = @"^\\d{11}$";
    NSPredicate *number = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [number evaluateWithObject:self];
}

//验证电话号码号码:格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
- (BOOL)validateTelephone{
    NSString *numberRegex = @"^(\(\\d{3,4}\\)|\\d{3,4}-)?\\d{7,8}$";
    NSPredicate *number = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [number evaluateWithObject:self];
}

//验证电话号码或者手机号码
- (BOOL)validatePhone{
    NSString *numberRegex = @"(\\d{3}-\\d{8}|\\d{4}-\\d{7})｜(^((\(\\d{3}\\))|(\\d{3}\\-))?13\\d{9}|15[89]\\d{8}$)";
    NSPredicate *number = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [number evaluateWithObject:self];
}

//验证密码：以字母开头，长度在6-18之间，只能包含字符、数字和下划线
- (BOOL)validatePassword{
    NSString *numberRegex = @"^[a-zA-Z]\\w{5,17}$";
    NSPredicate *number = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [number evaluateWithObject:self];
}
@end
