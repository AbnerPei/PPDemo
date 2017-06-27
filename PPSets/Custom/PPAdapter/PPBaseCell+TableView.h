//
//  PPBaseCell+TableView.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseCell.h"

@interface PPBaseCell (TableView)
+(instancetype)pp_cellMakeWithTableView:(UITableView *)tableView
                            cellAdapter:(PPCellAdapter *)cellAdapter
                              indexPath:(NSIndexPath *)indexPath;
@end
