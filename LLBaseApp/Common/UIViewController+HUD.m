//
//  UIViewController+HUD.m
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "UIViewController+HUD.h"
#import "Config_Tools.h"

@implementation UIViewController (HUD)

- (void)showMessage:(NSString *)message view:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:ll_sl_HUDAnimationTime];
}

- (void)showMessage:(NSString *)message view:(UIView *)view afterDelay:(NSTimeInterval)delay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:delay];
}

- (MBProgressHUD *)showHUDMessage:(NSString *)message view:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = YES;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:10.f];
    return hud;
}

- (void)showMessage:(NSString *)message view:(UIView *)view complate:(hudHideBlock)block{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:2.f complate:^{
        block();
    }];
}

- (void)showMessageByTitle:(NSString *)title detailMessgae:(NSString *)detail view:(UIView *)view afterDelay:(NSTimeInterval)delay complate:(hudHideBlock)block{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.detailsLabel.text = detail;
    [hud hideAnimated:YES afterDelay:delay complate:^{
        block();
    }];
}

- (void)showDone:(NSString *)message view:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:ll_sl_HUDAnimationTime];
}

- (void)showDone:(NSString *)message view:(UIView *)view complate:(hudHideBlock)block{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    [hud hideAnimated:YES afterDelay:1.5f complate:^{
        block();
    }];
}

@end
