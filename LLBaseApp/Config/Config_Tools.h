//
//  Config_Tools.h
//  SLBaseApp
//
//  Created by LvJianfeng on 16/7/14.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark ImportHeader
#import "Utils.h"
#import "LineView.h"
//Category
#import "UIView+Frame.h"
#import "UIDevice+Hardware.h"
#import "NSDate+Formatter.h"
//3Libs
#import "MJExtension.h"
#import "AFNetworking.h"
#import "LLNoDataView.h"
#import "MBProgressHUD.h"

#pragma mark Define
#define ll_sl_ColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//屏幕宽
#define ll_sl_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//屏幕高
#define ll_sl_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//分割线颜色
#define ll_sl_LineColor ll_sl_ColorWithRGB(0xd4d4d4)
//提示显示时间
#define ll_sl_HUDAnimationTime 3.0f

//网络状态
#define ll_sl_UnAuthorized @"401"
#define ll_sl_Forbidden @"403"
#define ll_sl_ServiceUnavailable @"503"
#define ll_sl_ReLoginPrompt @"用户登录时间失效，请重新登录"

//Server Host
#define ll_sl_Server_Host                              @""

#pragma mark 菜单Cell格式配置
//标题文本颜色
#define ll_sl_Title_Color ll_sl_ColorWithRGB(0x333333)
//高度
extern CGFloat  const Menu_Cell_Height;
extern CGFloat  const Icon_Width;
extern CGFloat  const Icon_Height;
extern CGFloat  const Arrow_Icon_Height;
extern CGFloat  const Arrow_Icon_Width;
extern CGFloat  const Leading_Padding;
extern CGFloat  const Trailing_Padding;
extern CGFloat  const Title_Font_Size;
extern NSString *const Arrow_ImageNamed;




@interface Config_Tools : NSObject

@end
