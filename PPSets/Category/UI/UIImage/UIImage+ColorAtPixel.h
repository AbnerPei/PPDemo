//
//  UIImage+ColorAtPixel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
/*
 UIImage+ColorAtPixel.h
 
 Created by Ole Begemann
 October, 2009
 */

#import <UIKit/UIKit.h>

/**
 获取图片指定点像素的颜色 [pp2017-07-14测试，不是很准]
 */
@interface UIImage (ColorAtPixel)
-(UIColor *)pp_colorAtPixel:(CGPoint)point;
@end
