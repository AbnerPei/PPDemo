//
//  UIView+SpecialUI.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIView+SpecialUI.h"

@implementation UIView (SpecialUI)

/** 【用UIView *创建一根实线】 父视图 实线颜色 */
+(UIView *)pp_lineWithSuperV:(UIView *)superV
                   lineColor:(UIColor *)lineColor
{
    UIView *V = [[UIView alloc]init];
    V.backgroundColor = lineColor;
    return V;
}

/** 【用UIView *创建一根实线】 父视图 实线颜色 实线frame*/
+(UIView *)pp_lineWithSuperV:(UIView *)superV
                   lineColor:(UIColor *)lineColor
                   lineFrame:(CGRect)lineFrame
{
    UIView *V = [self pp_lineWithSuperV:superV lineColor:lineColor];
    V.frame = lineFrame;
    return V;
}

/** 【(用imgV)创建一个线】 父视图 图片名  */
+(UIImageView *)pp_dashedLineWithSuperV:(UIView *)superV
                                imgName:(NSString *)imgName
{
    UIImageView *imgV = [[UIImageView alloc]init];
    if (superV) {
        [superV addSubview:imgV];
    }
    imgV.contentMode = UIViewContentModeScaleToFill;
    if (imgName && imgName.length != 0) {
        imgV.image = [UIImage imageNamed:imgName];
    }
    return imgV;
}

/** 【(用imgV)创建一个线】 父视图 图片名 线的frame */
+(UIImageView *)pp_dashedLineWithSuperV:(UIView *)superV
                                imgName:(NSString *)imgName
                              lineFrame:(CGRect)lineFrame
{
    UIImageView *imgV = [self pp_dashedLineWithSuperV:superV imgName:imgName];
    imgV.frame = lineFrame;
    return imgV;
}

/** 【用CAShapeLayer创建一根线】 父视图 可见的一小段线的宽度 线段间距 线颜色 */
+(UIView *)pp_dashedLineByCAShapeLayerWithSuperV:(UIView *)superV
                                    oneLineWidth:(CGFloat)oneLineWidth
                                      lineMargin:(CGFloat)lineMargin
                                       lineColor:(UIColor *)lineColor
{
    UIView *dashedLine = [[UIView alloc] init];
    dashedLine.backgroundColor = [UIColor clearColor];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:dashedLine.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(dashedLine.frame) / 2, CGRectGetHeight(dashedLine.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:lineColor.CGColor];
    [shapeLayer setLineWidth:CGRectGetHeight(dashedLine.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:oneLineWidth], [NSNumber numberWithFloat:lineMargin], nil]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(dashedLine.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [dashedLine.layer addSublayer:shapeLayer];
    return dashedLine;
}


@end
