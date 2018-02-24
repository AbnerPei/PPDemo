//
//  PPCircleView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/18.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPCircleView.h"

//弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
//角度转弧度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation PPCircleView


- (void)drawRect:(CGRect)rect {
    //1.圆形
    UIBezierPath *bPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50
                                                     startAngle: DEGREES_TO_RADIANS(135) endAngle:M_PI*2 clockwise:YES];
    
    //设置颜色
    [[UIColor redColor]setStroke];
    //设置线宽
    [bPath setLineWidth:5];
    //绘制
    [bPath stroke];
    
    //2.椭圆
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 150, 100, 200)];
    [ovalPath setLineWidth:5];
    [ovalPath stroke];
    
    //3.矩形
    UIBezierPath *myBezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 50)];
    
    [[UIColor whiteColor]setStroke];
    [myBezierPath setLineWidth:5];
    [myBezierPath stroke];
    
    //4.圆角矩形
    //UIRectCorner可以设置 哪几个角是圆角，其他不变
    UIBezierPath *tBPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(220, 20, 100, 100)
                                                 byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
    
    [[UIColor greenColor]setStroke];
    [tBPath setLineWidth:5];
    [tBPath stroke];
    
    //5.通过添加点生成任意图形
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 15.0;
    
    aPath.lineCapStyle = kCGLineCapButt;  //线条终点
    //round 圆形
    //butt 平的 默认值 把线连接到精准的终点
    //Square 平的，会把线延伸到终点再加上线宽的一半
    aPath.lineJoinStyle = kCGLineJoinBevel;  //拐点处理
    //bevel 斜角斜面，角的外侧是平的不圆滑
    //miter 斜接 角的外侧是尖的
    //round 圆角
    
    //这是起点
    [aPath moveToPoint:CGPointMake(100.0, 200.0)];
    
    //添加点
    [aPath addLineToPoint:CGPointMake(200.0, 240.0)];
    [aPath addLineToPoint:CGPointMake(160, 340)];
    [aPath addLineToPoint:CGPointMake(40.0, 340)];
    [aPath addLineToPoint:CGPointMake(10.0, 240.0)];
    [aPath closePath]; //第五条线通过调用closePath方法得到的
    
    [aPath stroke]; //Draws line 根据坐标点连线
    

}

@end
