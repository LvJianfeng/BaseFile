//
//  SLMenuTableViewCell.h
//  SLComeMoney
//
//  Created by LvJianfeng on 16/5/19.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config_Tools.h"

@interface SLMenuTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

//分割线
@property (weak, nonatomic) LineView *top_Line;
@property (weak, nonatomic) LineView *bottom_Line;

//图标
@property (weak, nonatomic) UIImageView *icon_ImageView;
@property (weak, nonatomic) UILabel *title_Label;
@end
