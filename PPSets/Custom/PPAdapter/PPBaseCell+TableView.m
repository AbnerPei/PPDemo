//
//  PPBaseCell+TableView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseCell+TableView.h"

@implementation PPBaseCell (TableView)
+(instancetype)pp_cellMakeWithTableView:(UITableView *)tableView
                            cellAdapter:(PPCellAdapter *)cellAdapter
                              indexPath:(NSIndexPath *)indexPath
{
    PPBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellAdapter.cellIdentifier];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellAdapter.cellIdentifier];
    }
    [cell pp_cellSetupWithAdapter:cellAdapter cellData:cellAdapter.cellData tableView:tableView indexPath:indexPath];
    [cell pp_cellAddDataAndFrame];
    return cell;
}
@end
