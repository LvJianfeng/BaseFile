//
//  LineView.m
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "LineView.h"
@implementation LineView

- (id)init{
    self = [super init];
    if (self) {
        for (NSLayoutConstraint *constraint in self.constraints) {
            
            if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight) {
                constraint.constant = (1.0 / [UIScreen mainScreen].scale);
            }
        }
        self.backgroundColor = ll_sl_LineColor;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (self.constraints.count>0) {
            for (NSLayoutConstraint *constraint in self.constraints) {
                
                if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight) {
                    constraint.constant = (1.0 / [UIScreen mainScreen].scale);
                }
                if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth) {
                    constraint.constant = (1.0 / [UIScreen mainScreen].scale);
                }
            }
        }else {
            self.height = (1.0 / [UIScreen mainScreen].scale);
        }
         self.backgroundColor = ll_sl_LineColor;
    } 
    return self;
}

- (void)awakeFromNib{

    
    for (NSLayoutConstraint *constraint in self.constraints) {
        
        if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeHeight && constraint.constant == 1) {
            constraint.constant = (1.0 / [UIScreen mainScreen].scale);
            break;
        }
        if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth && constraint.constant == 1) {
            constraint.constant = (1.0 / [UIScreen mainScreen].scale);
            break;
        }
    }
    self.backgroundColor = ll_sl_LineColor;
}




@end



@implementation DashLineView
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    
    CGFloat lengths[] = {4,2};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, self.frame.size.width, 0.0);
    CGContextStrokePath(context);
}

@end

@implementation VerticalView

- (id)init{
    self = [super init];
    if (self) {
        for (NSLayoutConstraint *constraint in self.constraints) {
            
            if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth) {
                constraint.constant = (1.0 / [UIScreen mainScreen].scale);
            }
        }
        self.backgroundColor = ll_sl_LineColor;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (self.constraints.count>0) {
            for (NSLayoutConstraint *constraint in self.constraints) {
                
                if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth) {
                    constraint.constant = (1.0 / [UIScreen mainScreen].scale);
                }
            }
        }else {
            self.width = (1.0 / [UIScreen mainScreen].scale);
        }
        self.backgroundColor = ll_sl_LineColor;
    }
    return self;
}

- (void)awakeFromNib{
    
    
    for (NSLayoutConstraint *constraint in self.constraints) {
        
        if (constraint.firstItem == self && constraint.firstAttribute == NSLayoutAttributeWidth && constraint.constant == 1) {
            constraint.constant = (1.0 / [UIScreen mainScreen].scale);
            break;
        }
    }
    self.backgroundColor = ll_sl_LineColor;
}




@end
