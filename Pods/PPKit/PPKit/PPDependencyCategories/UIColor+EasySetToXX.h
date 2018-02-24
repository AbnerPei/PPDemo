//
//  UIColor+EasySetToXX.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIColor主动去给需要它的主人（XX）配置
 */
@interface UIColor (EasySetToXX)

/**
 * 给NSMutableAttributedString设置字体颜色
 */
+(void)pp_colorSetWithTextColor:(UIColor *)textColor
               forAttributedStr:(NSMutableAttributedString *)attributedStr;

/**
 * 给NSMutableAttributedString中specialText设置字体颜色
 */
+(void)pp_colorSetWithSpecialTextColor:(UIColor *)specialTextColor
                      forAttributedStr:(NSMutableAttributedString *)attributedStr
                           specialText:(NSString *)specialText;
@end
