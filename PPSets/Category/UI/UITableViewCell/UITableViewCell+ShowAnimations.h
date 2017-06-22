//
//  UITableViewCell+ShowAnimations.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/01.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
typedef NS_ENUM(NSInteger,UITableViewCellShowAnimationStyle){
    UITableViewCellShowAnimationStyleBottomTop,   //由下到上，匀速
};
#import <UIKit/UIKit.h>

@interface UITableViewCell (ShowAnimations)

/******
   【使用指导】：
 1. 在对应VC里声明,并在其ViewDidLoad中初始化
//   //cell动画indexPath集合
//     @property(nonatomic,strong)NSMutableSet *cellAnimationIndexPaths;

//       self.cellAnimationIndexPaths = [NSMutableSet set];
 
 2.实现如下代码
 - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
 {
          if (![self.cellAnimationIndexPaths containsObject:indexPath]) {
              [self.cellAnimationIndexPaths addObject:indexPath];
              CGFloat rowHeight = [self tableView:tableView heightForRowAtIndexPath:indexPath];
              [cell pp_showAnimationWithAnimationStyle:UITableViewCellShowAnimationStyleBottomTop cellHeight:rowHeight tableView:tableView indexPath:indexPath];
              }
 }
 3. 附加：比如下拉刷洗时，加一句：
     [self.cellAnimationIndexPaths removeAllObjects];

 ***/

/**
 tableViewCell 显示动画
 
 @param showAnimationStyle 动画样式
 @param cellHeight 当前cell的高度 【建议这样调用：CGFloat cellHeight =  [self tableView:tableView heightForRowAtIndexPath:indexPath];】
 @param tableView 当前tableView
 @param indexPath 当前indexPath
 */
-(void)pp_showAnimationWithAnimationStyle:(UITableViewCellShowAnimationStyle)showAnimationStyle
                               cellHeight:(CGFloat)cellHeight
                                tableView:(UITableView *)tableView
                                indexPath:(NSIndexPath *)indexPath;
@end
