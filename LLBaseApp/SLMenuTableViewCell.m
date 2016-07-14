//
//  SLMenuTableViewCell.m
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/19.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import "SLMenuTableViewCell.h"

@implementation SLMenuTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"SLMenuTableViewCell";
    SLMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SLMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //点击效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //菜单Cell 高度固定值40.f
        //Top Line
        LineView *top_Line = [[LineView alloc] initWithFrame:CGRectMake(0, 0, ll_sl_SCREEN_WIDTH, 1)];
        top_Line.backgroundColor = ll_sl_LineColor;
        [self.contentView addSubview:top_Line];
        self.top_Line = top_Line;
        
        //Under Line
        LineView *bottom_Line = [[LineView alloc] initWithFrame:CGRectMake(0, Menu_Cell_Height-0.5, ll_sl_SCREEN_WIDTH, 1)];
        bottom_Line.backgroundColor = ll_sl_LineColor;
        [self.contentView addSubview:bottom_Line];
        self.bottom_Line = bottom_Line;
        
        //Icon
        UIImageView *icon_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Leading_Padding, Menu_Cell_Height * 0.5 - Icon_Height * 0.5, Icon_Width, Icon_Height)];
        [self.contentView addSubview:icon_ImageView];
        self.icon_ImageView = icon_ImageView;
        
        //Title
        UILabel *title_Label = [[UILabel alloc] initWithFrame:CGRectMake(icon_ImageView.maxX + Leading_Padding, 0, 200, Menu_Cell_Height)];
        title_Label.textColor = ll_sl_Title_Color;
        title_Label.font = [UIFont systemFontOfSize:Title_Font_Size];
        [self.contentView addSubview:title_Label];
        self.title_Label = title_Label;
        
        //Arrow Icon ImageView
        UIImageView *arrow_ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ll_sl_SCREEN_WIDTH - Arrow_Icon_Width - Trailing_Padding, Menu_Cell_Height * 0.5 - Arrow_Icon_Height * 0.5, Arrow_Icon_Width, Arrow_Icon_Height)];
        arrow_ImageView.image = [UIImage imageNamed:Arrow_ImageNamed];
        [self.contentView addSubview:arrow_ImageView];
    }
    return self;
}

@end
