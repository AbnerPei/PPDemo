//
//  UIScreen+EasilySize.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIScreen+EasilySize.h"

@implementation UIScreen (EasilySize)
+ (CGSize)pp_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)pp_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)pp_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

@end
