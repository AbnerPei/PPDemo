//
//  UIColor+EasySetToXX.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIColor+EasySetToXX.h"
#import "YYText.h"

@implementation UIColor (EasySetToXX)

/**
 * 给NSMutableAttributedString设置字体颜色
 */
+(void)pp_colorSetWithTextColor:(UIColor *)textColor
               forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (textColor && attributedStr) {
        attributedStr.yy_color = textColor;
    }
}

/**
 * 给NSMutableAttributedString中specialText设置字体颜色
 */
+(void)pp_colorSetWithSpecialTextColor:(UIColor *)specialTextColor
                      forAttributedStr:(NSMutableAttributedString *)attributedStr
                           specialText:(NSString *)specialText
{
    if (!specialText || specialText.length == 0) {
        return;
    }
    if (!attributedStr || attributedStr.string.length == 0) {
        return;
    }
    if ([attributedStr.string containsString:specialText]) {
        NSRange specialRange = [attributedStr.string rangeOfString:specialText];
        if (specialTextColor) {
            [attributedStr yy_setColor:specialTextColor range:specialRange];
        }
    }
}
@end
