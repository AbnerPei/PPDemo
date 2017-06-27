//
//  PPBaseCell.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPCellAdapter;

@interface PPBaseCell : UITableViewCell
/** cell的adapter  */
@property(nonatomic,weak)PPCellAdapter *cellAdapter;
/** 数据源  */
@property(nonatomic,weak)id cellData;
/** 持有的tableView  */
@property(nonatomic,weak)UITableView *tableView;
/** 持有的indexPath  */
@property(nonatomic,weak)NSIndexPath *indexPath;
/** 持有的VC，可用来在该VC在cell内部完成push跳转  */
@property(nonatomic,weak)UIViewController *viewController;

#pragma mark --- 子类重写的方法 -------start
/** cell的配置方法。【用来被子类重写】*/
-(void)pp_cellConfigure;
/** cell添加子控件。【用来被子类重写】*/
-(void)pp_cellAddSubviews;
/** cell填充数据源及子控件frame设置。【用来被子类重写】*/
-(void)pp_cellAddDataAndFrame;
/** 获取cell的高度。【用来被子类重写】*/
+(CGFloat)pp_cellHeightWithCellData:(id)data;
/** cell点击事件。【用来被子类重写】*/
-(void)pp_cellDidSelected;
#pragma mark --- 子类重写的方法 -------end

/**
 给cell配置属性值
 */
-(void)pp_cellSetupWithAdapter:(PPCellAdapter *)cellAdapter
                      cellData:(id)cellData
                     tableView:(UITableView *)tableView
                     indexPath:(NSIndexPath *)indexPath;

- (void)pp_cellUpdateWithNewCellHeight:(CGFloat)newCellHeight
                              animated:(BOOL)animated;

@end
