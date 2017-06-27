//
//  PPBaseCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseCell.h"

@implementation PPBaseCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self pp_cellConfigure];
        [self pp_cellAddSubviews];
    }
    return self;
}
/** cell的配置方法。【用来被子类重写】*/
-(void)pp_cellConfigure;
{
    
}
/** cell添加子控件。【用来被子类重写】*/
-(void)pp_cellAddSubviews
{
    
}
/** cell填充数据源及子控件frame设置。【用来被子类重写】*/
-(void)pp_cellAddDataAndFrame
{
    
}
/** 获取cell的高度。【用来被子类重写】*/
+(CGFloat)pp_cellHeightWithCellData:(id)data
{
    return 0.f;
}
/** cell点击事件。【用来被子类重写】*/
-(void)pp_cellDidSelected
{
    
}

/**
 给cell配置属性值
 */
-(void)pp_cellSetupWithAdapter:(PPCellAdapter *)cellAdapter
                      cellData:(id)cellData
                     tableView:(UITableView *)tableView
                     indexPath:(NSIndexPath *)indexPath 
{
    _cellAdapter = cellAdapter;
    _cellData = cellData;
    _tableView = tableView;
    _indexPath = indexPath;
}

- (void)pp_cellUpdateWithNewCellHeight:(CGFloat)newCellHeight animated:(BOOL)animated
{
    if (_tableView && _cellAdapter) {
        _cellAdapter.cellHeight = newCellHeight;
        if (animated) {
            [_tableView beginUpdates];
            [_tableView endUpdates];
        } else {
            [_tableView reloadData];
        }
    }
}
@end
