//
//  UIScreen+PPSets.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/9/11.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "UIScreen+PPSets.h"

@implementation UIScreen (PPSets)

@end


@implementation UIScreen (Size)

+(CGSize)pp_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+(CGFloat)pp_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+(CGFloat)pp_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

@end