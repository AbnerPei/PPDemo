//
//  UITableView+MakeTableV.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (MakeTableV)

/** 创建tableView 【父视图 frame 代理 背景色 TableViewStyle】*/
+(instancetype)pp_tableVMakeWithSuperV:(UIView *)superV
                                 frame:(CGRect)frame
                              delegate:(id)delegate
                               bgColor:(UIColor *)bgColor
                                 style:(UITableViewStyle)style;
@end
