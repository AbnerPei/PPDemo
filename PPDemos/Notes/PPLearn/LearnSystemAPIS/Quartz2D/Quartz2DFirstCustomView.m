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
    
    //1. 获取图形上下文对象
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    ////所有的绘画操作，必须在图形上下文对象中
    //设置线的宽度
    CGContextSetLineWidth(ctr, 10);
    //设置首尾端的样式
    CGContextSetLineCap(ctr, kCGLineCapRound);

    //2. 设置绘画的当期点
    CGContextMoveToPoint(ctr, 10, 10);
    
    //3. 根据当前点添加一条线到目标点
    CGContextAddLineToPoint(ctr, 60, 60);
    
    //4.显示在view上
    CGContextStrokePath(ctr);
}


@end
