//
//  PAWaterflowLayout.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/7/2.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PAWaterflowLayout;

@protocol PAWaterflowLayoutDelegate <NSObject>
@required
/*!
 *  获取每个瀑布流的item的height
 */
- (CGFloat)waterflowLayout:(PAWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/*!  列数，默认是3列 */
- (CGFloat)columnCountInWaterflowLayout:(PAWaterflowLayout *)waterflowLayout;
/*!  列间距，默认是10 */
- (CGFloat)columnMarginInWaterflowLayout:(PAWaterflowLayout *)waterflowLayout;
/*!  行间距，默认是10 */
- (CGFloat)rowMarginInWaterflowLayout:(PAWaterflowLayout *)waterflowLayout;
/*!  边缘间距，默认是{10, 10, 10, 10} */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(PAWaterflowLayout *)waterflowLayout;
@end

@interface PAWaterflowLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<PAWaterflowLayoutDelegate> delegate;
@end
