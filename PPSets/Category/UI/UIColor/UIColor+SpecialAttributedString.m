//
//  UIColor+SpecialAttributedString.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIColor+SpecialAttributedString.h"

@implementation UIColor (SpecialAttributedString)
+(void)pp_colorWithSpecialColor:(UIColor *)specialColor specialText:(NSString *)specialText forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (!specialText || specialText.length == 0) {
        return;
    }
    if (!attributedStr || attributedStr.string.length == 0) {
        return;
    }
    if ([attributedStr.string containsString:specialText]) {
        NSRange specialRange = [attributedStr.string rangeOfString:specialText];
        if (specialColor && [specialColor isKindOfClass:[UIColor class]]) {
            [attributedStr yy_setColor:specialColor range:specialRange];
        }
    }
}

+(void)pp_colorWithTextColor:(UIColor *)textColor forYYLabel:(YYLabel *)lb
{
    if (textColor) {
        lb.textColor = textColor;
    }
}
+(void)pp_colorWithTextColor:(UIColor *)textColor forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (textColor) {
        attributedStr.yy_color = textColor;
    }
}
@end
