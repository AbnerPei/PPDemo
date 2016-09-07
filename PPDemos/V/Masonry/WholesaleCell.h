//
//  WholesaleCell.h
//  MassonryDemos
//
//  Created by Abner on 16/6/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WholesaleView;
@interface WholesaleCell : UITableViewCell

@property (strong, nonatomic) WholesaleView *leftV;
@property (strong, nonatomic) WholesaleView *rightV;

/**
 *  对应的bt点击事件，根据是否是左边判断
 */
@property (nonatomic,copy)void(^WholesaleCellClickedBlock)(BOOL isLeft);
/**
 *  填充数据
 *  @param imgNames 图片名字数组
 *  @param titles 文字数组
 */
-(void)setupWholesaleCellData:(NSArray *)imgNames titles:(NSArray *)titles;

@end

@interface WholesaleView : UIView

@property (strong, nonatomic) UIImageView *imgV;
@property (strong, nonatomic) UILabel *textLB;

@end