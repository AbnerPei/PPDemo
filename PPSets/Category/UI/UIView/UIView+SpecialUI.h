//
//  UIView+SpecialUI.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SpecialUI)

/** 【用UIView *创建一根实线】 父视图 实线颜色 */
+(UIView *)pp_lineWithSuperV:(UIView *)superV
                   lineColor:(UIColor *)lineColor;

/** 【用UIView *创建一根实线】 父视图 实线颜色 实线frame*/
+(UIView *)pp_lineWithSuperV:(UIView *)superV
                   lineColor:(UIColor *)lineColor
                   lineFrame:(CGRect)lineFrame;

/** 【(用imgV)创建一个线】 父视图 图片名  */
+(UIImageView *)pp_dashedLineWithSuperV:(UIView *)superV
                                imgName:(NSString *)imgName;

/** 【(用imgV)创建一个线】 父视图 图片名 线的frame */
+(UIImageView *)pp_dashedLineWithSuperV:(UIView *)superV
                                imgName:(NSString *)imgName
                              lineFrame:(CGRect)lineFrame;

/** 【用CAShapeLayer创建一根线】 父视图 可见的一小段线的宽度 线段间距 线颜色 */
+(UIView *)pp_dashedLineByCAShapeLayerWithSuperV:(UIView *)superV
                                    oneLineWidth:(CGFloat)oneLineWidth
                                      lineMargin:(CGFloat)lineMargin
                                       lineColor:(UIColor *)lineColor;

@end
