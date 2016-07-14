//
//  NSNumber+Format.h
//  ShanLinCaiFu
//
//  Created by wuqh on 16/3/19.
//  Copyright © 2016年 ShanLinJinRong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Format)

/**
 *  带￥符号，切包含小数
 */
- (NSString *)formateCountNumChina;
/**
 * 不带￥符号，但保留两位
 */
- (NSString *)formateCountNum;

- (NSString *)formateCountNumNoFloat;

- (NSString *)toString;
- (NSString *)to2fString;
/**
 * 百分比
 */
- (NSString *)to2fRateString;
- (NSString *)toMoneyString;
- (NSString *)toDayString;

- (double) toDoubleValueMulti100;

- (NSString *)formateFractionDigits;
//MAX count = 5
- (NSString *)formateFractionDigitsCount:(NSInteger)count;

- (NSString *)formateDateYYYYMMDD;
- (NSString *)formateDateYYYYMMDDHHMMSS;
- (NSString *)formateDateYYYYMMDDEEEE;
- (NSString *)formateDateYYYYMMDDHHMMSSByDiagonal;

- (double )notRoundingAfterPoint:(NSInteger)position;

- (double )notRoundingAfterPoint;

@end
