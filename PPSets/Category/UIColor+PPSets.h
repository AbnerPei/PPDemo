//
//  UIColor+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PPSets)

@end


@interface UIColor (Hex)
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)pp_colorWithHexString:(NSString *)color;
+ (UIColor *)pp_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end