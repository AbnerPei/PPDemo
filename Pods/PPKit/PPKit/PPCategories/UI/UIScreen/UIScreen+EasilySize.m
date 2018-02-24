//
//  UIScreen+EasilySize.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIScreen+EasilySize.h"


@implementation UIScreen (EasilySize)
+ (CGSize)pp_size{
    return getScreenSize();
}

+ (CGFloat)pp_width{
    return getScreenSize().width;
}

+ (CGFloat)pp_height{
    return getScreenSize().height;
}

+ (CGFloat)pp_scale
{
    return [UIScreen mainScreen].scale;
}

static CGSize getScreenSize(){
    return [[UIScreen mainScreen] bounds].size;
}
@end
