//
//  Quartz2DFirstCustomView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "Quartz2DFirstCustomView.h"

@implementation Quartz2DFirstCustomView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    

    //1.画一条线
//    [self drawLine];
    
    //2.画个直角三角形
    [self drawRightTriangle];
    
    
}

-(void)drawLine
{
    
    /*
     [iOS CoreGraphics CGLineCap 枚举值含义](http://blog.csdn.net/lwjok2007/article/details/50885027)
    // Line cap styles.
    typedef CF_ENUM(int32_t, CGLineCap) {
        kCGLineCapButt,     //该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
        kCGLineCapRound,    //该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆
     kCGLineCapSquare    //该属性值指定绘制方形端点。线条结尾处绘制半个边长为线条宽度的正方形,需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已.
    };
     */
    
    //1. 获取图形上下文对象
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    ////所有的绘画操作，必须在图形上下文对象中
    //设置线的宽度
    CGContextSetLineWidth(ctr, 10);
    //设置首尾端的样式
    CGContextSetLineCap(ctr, kCGLineCapSquare);
    //设置颜色
    CGContextSetRGBStrokeColor(ctr, 0, 0, 0, 1);
    
    //2. 设置绘画的当前点
    CGContextMoveToPoint(ctr, 20, 20);
    
    //3. 根据当前点添加一条线到目标点
    CGContextAddLineToPoint(ctr, 150, 20);
    
    //4.显示在view上
    CGContextStrokePath(ctr);
}

-(void)drawRightTriangle
{
    /*
     typedef CF_ENUM(int32_t, CGLineJoin) {
     kCGLineJoinMiter,  //尖角
     kCGLineJoinRound,  //圆角
     kCGLineJoinBevel   //斜角
     };
     */
    //1. 获取图形上下文对象
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    //设置线的宽度
    CGContextSetLineWidth(ctr, 10);
    //设置线段之间的连接方式
    CGContextSetLineJoin(ctr, kCGLineJoinBevel);
    
    //2. 设置绘画的当前点
    CGContextMoveToPoint(ctr, 20, 20);
    
    //3. 根据当前点添加一条线到目标点
    CGContextAddLineToPoint(ctr, 150, 20);
    
    CGContextAddLineToPoint(ctr, 150, 130);
    
    //关闭绘画，将第一个点和最后一个点连接起来
    CGContextClosePath(ctr);
    
    //4.显示在view上
    CGContextStrokePath(ctr);
}
@end
