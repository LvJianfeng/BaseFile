//
//  NSNumber+Format.m
//  ShanLinCaiFu
//
//  Created by wuqh on 16/3/19.
//  Copyright © 2016年 ShanLinJinRong. All rights reserved.
//

#import "NSNumber+Format.h"

@implementation NSNumber (Format)

- (NSString *)formateCountNumChina {
    NSNumberFormatter *numFormate = [[NSNumberFormatter alloc] init];
    numFormate.numberStyle = NSNumberFormatterCurrencyStyle;

    NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf",[self doubleValue]]   ];
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *roundedOunces = [num decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    NSString *numStr = [numFormate stringFromNumber:roundedOunces];
    
    return [numStr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"￥"];
}

- (NSString *)formateCountNum {
    
    return [[self formateCountNumChina] substringFromIndex:1];

}

- (NSString *)formateCountNumNoFloat {
    NSNumberFormatter *numFormat = [[NSNumberFormatter alloc] init] ;
    [numFormat setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *num = [NSNumber numberWithDouble:[self doubleValue]];
    return [numFormat stringFromNumber:num];
}

//money
- (NSString *)formateFractionDigits{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###,###,##0.00"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:self];
    return formattedNumberString;
}

- (NSString *)formateFractionDigitsCount:(NSInteger)count{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSString *formateStr = @"###,###,##0.00";
    switch (count) {
        case 1:
            formateStr = @"###,###,##0.0";
            break;
        case 3:
            formateStr = @"###,###,##0.000";
            break;
        case 4:
            formateStr = @"###,###,##0.0000";
            break;
        case 5:
            formateStr = @"###,###,##0.00000";
            break;
        default:
            break;
    }
    [numberFormatter setPositiveFormat:formateStr];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:self];
    return formattedNumberString;
}


//

- (NSString *)formateDateYYYYMMDD {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)([self doubleValue]/1000)];
    return [formatter stringFromDate:confromTimesp];
    
}
- (NSString *)formateDateYYYYMMDDHHMMSS {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)([self doubleValue]/1000)];
    return [formatter stringFromDate:confromTimesp];
}

//斜线
- (NSString *)formateDateYYYYMMDDHHMMSSByDiagonal {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)([self doubleValue]/1000)];
    return [formatter stringFromDate:confromTimesp];
}

- (NSString *)formateDateYYYYMMDDEEEE{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YYYY年MM月dd日 EEEE"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)([self doubleValue]/1000)];
    return [formatter stringFromDate:confromTimesp];
}


- (NSString *)toString{
    return [self stringValue];
}

- (NSString *)to2fString{
    return [NSString stringWithFormat:@"%.2lf",[self doubleValue]];
}

- (NSString *)to2fRateString{
    return [NSString stringWithFormat:@"%.2lf%%",[self doubleValue]*100];
}

- (double) toDoubleValueMulti100{
    return [self doubleValue]*100;
}

- (NSString *)toMoneyString{
    if ([self to2fString]) {
        return [[self to2fString] stringByAppendingString:@"元"];
    }
   return @"0元";
}

- (NSString *)toDayString{
    if ([self stringValue]) {
        return [[self stringValue] stringByAppendingString:@"天"];
    }
    return @"0天";
}

#pragma mark - 数字截取
- (double )notRoundingAfterPoint:(NSInteger)position {
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf",[self doubleValue]]];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return roundedOunces.doubleValue;
}

#pragma mark - 数字截取
- (double )notRoundingAfterPoint{
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:4 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%lf",[self doubleValue]]];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return roundedOunces.doubleValue*100;
}



@end
