//
//  UITableViewCell+CellMake.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UITableViewCell+CellMake.h"

@implementation UITableViewCell (CellMake)
+(instancetype)pp_cellMakeWithTableView:(UITableView *)tableView
{
    if (!tableView) {
        NSLog(@"%@%s",@"你未传入有效tableView,虽然不影响获取cell,但无法复用！！！",__func__);
    }
    NSString * identifier = [NSString stringWithFormat:@"%@Identifier",NSStringFromClass(self)];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
@end
