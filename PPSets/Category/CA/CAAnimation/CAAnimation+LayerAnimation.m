//
//  CAAnimation+LayerAnimation.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "CAAnimation+LayerAnimation.h"

@implementation CAAnimation (LayerAnimation)
/** 图片左右抖动 */
+(CAKeyframeAnimation *)pp_shakeRepeat
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:TransformRotation];
    animation.values = @[
                         @(pAngleToRadian(-10)),
                         @(pAngleToRadian(10)),
                         @(pAngleToRadian(-10))
                         ];
    animation.duration = 0.3;
    //动画重复次数
    animation.repeatCount = MAXFLOAT;
    //保持动画执行完后的状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}
@end
