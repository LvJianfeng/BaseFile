//
//  UIViewController+HUD.h
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config_Tools.h"

@interface UIViewController (HUD)
//提示hud
- (void)showMessage:(NSString *)message view:(UIView *)view;
- (void)showMessage:(NSString *)message view:(UIView *)view afterDelay:(NSTimeInterval)delay;
- (MBProgressHUD *)showHUDMessage:(NSString *)message view:(UIView *)view;
- (void)showDone:(NSString *)message view:(UIView *)view;
- (void)showMessage:(NSString *)message view:(UIView *)view complate:(hudHideBlock)block;
- (void)showMessageByTitle:(NSString *)title detailMessgae:(NSString *)detail view:(UIView *)view afterDelay:(NSTimeInterval)delay complate:(hudHideBlock)block;
- (void)showDone:(NSString *)message view:(UIView *)view complate:(hudHideBlock)block;
@end
