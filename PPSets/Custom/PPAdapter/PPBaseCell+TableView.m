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
    PPBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellAdapter.pp_ca_reuseIdentifier];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellAdapter.pp_ca_reuseIdentifier];
    }
    [cell pp_cellSetupWithAdapter:cellAdapter cellData:cellAdapter.pp_ca_dataSource tableView:tableView indexPath:indexPath];
    [cell pp_cellAddDataAndFrame];
    return cell;
}
@end
