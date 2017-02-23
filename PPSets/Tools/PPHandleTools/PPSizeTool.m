//
//  PPSizeTool.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPSizeTool.h"

@implementation PPSizeTool

+(CGFloat)pp_getWidth:(CGFloat)width
{
    return kScreenWidth*width/375;
}

+(CGFloat)pp_getHeight:(CGFloat)height
{
    return kScreenHeight*height/667;
}

@end
