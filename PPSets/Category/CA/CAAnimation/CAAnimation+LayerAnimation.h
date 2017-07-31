//
//  CAAnimation+LayerAnimation.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (LayerAnimation)

/** 图片左右抖动 */
+(CAKeyframeAnimation *)pp_shakeRepeat;
@end
