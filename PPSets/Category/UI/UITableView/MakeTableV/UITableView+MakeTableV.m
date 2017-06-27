//
//  UITableView+MakeTableV.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UITableView+MakeTableV.h"

@implementation UITableView (MakeTableV)
/** 创建tableView 【父视图 frame 代理 背景色 TableViewStyle】*/
+(instancetype)pp_tableVMakeWithSuperV:(UIView *)superV
                                 frame:(CGRect)frame
                              delegate:(id)delegate
                               bgColor:(UIColor *)bgColor
                                 style:(UITableViewStyle)style
{
    UITableView *tableV = [[UITableView alloc]initWithFrame:frame style:style];
    if (superV) {
        [superV addSubview:tableV];
    }
    if (delegate) {
        tableV.delegate = delegate;
        tableV.dataSource = delegate;
    }
    if (bgColor) {
        tableV.backgroundColor = bgColor;
    }
    //去掉所有分割线
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    //去掉多余的分割线
    [tableV setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    return tableV;
}
@end
