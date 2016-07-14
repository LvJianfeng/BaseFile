//
//  UILabel+SizeClassLabel.m
//  ShanLinCaiFu
//
//  Created by wuqh on 16/3/19.
//  Copyright © 2016年 wuqh. All rights reserved.
//

#import "UILabel+SizeClassLabel.h"
#import "UIDevice+Hardware.h"
@implementation UILabel (SizeClassLabel)


- (void)setAdjustFont:(BOOL)adjustFont {
    if (adjustFont) {
        UIFont *currentFont = self.font;
        CGFloat sizeScale = 1;
        Hardware hardward = [[UIDevice currentDevice] hardware];
        if (hardward==IPHONE_6 || hardward==IPHONE_6S) {
            sizeScale = 1.05;
        }else if (hardward==IPHONE_6_PLUS || hardward==IPHONE_6S_PLUS) {
            sizeScale = 1.1;
        }
        self.font = [currentFont fontWithSize:(currentFont.pointSize)*sizeScale];
    }
}

- (BOOL)adjustFont {
    return NO;
}


@end
