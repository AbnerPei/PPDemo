//
//  UIView+EasyTool.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIView+EasyTool.h"

@implementation UIView (EasyTool)
#pragma mark --- view转image
-(UIImage *)pp_viewToImage
{
    return [UIView pp_viewToImageWithV:self];
}
+(UIImage *)pp_viewToImageWithV:(UIView *)aV
{
    UIGraphicsBeginImageContext(aV.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [aV.layer renderInContext:ctx];
    UIImage* aImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aImage;
}
@end
