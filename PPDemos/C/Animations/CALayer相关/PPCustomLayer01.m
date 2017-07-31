//
//  PPCustomLayer01.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCustomLayer01.h"

@implementation PPCustomLayer01
-(void)drawInContext:(CGContextRef)ctx
{
    CGContextAddArc(ctx, 50, 50, 50, 0, M_PI*2, 0);
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextFillPath(ctx);
}
@end
