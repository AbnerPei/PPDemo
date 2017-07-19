//
//  UITextField+EmptyWarning.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UITextField+EmptyWarning.h"

@implementation UITextField (EmptyWarning)
-(void)pp_showEmptyWarning
{
    // 设置layer相关属性
    CAShapeLayer *alertLayer = [CAShapeLayer layer];
    // 大小和文本框一致
    alertLayer.frame = self.bounds;
    // 画线 非圆角
    alertLayer.path = [UIBezierPath bezierPathWithRoundedRect:alertLayer.bounds cornerRadius:0].CGPath;
    // 线宽
    alertLayer.lineWidth = 6. / [[UIScreen mainScreen] scale];
    // 设置为实线
    alertLayer.lineDashPattern = nil;
    // 填充颜色透明色
    alertLayer.fillColor = [UIColor clearColor].CGColor;
    // 边框颜色为红色
    alertLayer.strokeColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:alertLayer];
    
    // 透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.repeatCount = 5;
    opacityAnimation.repeatDuration = 2;
    opacityAnimation.autoreverses = YES;
    [alertLayer addAnimation:opacityAnimation forKey:@"opacity"];
    
    // 2秒后移除动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2秒后异步执行这里的代码...
        // 移除动画
        [alertLayer removeFromSuperlayer];
    });
    
}
@end
