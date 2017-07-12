//
//  YYLabel+Attributed.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+Attributed.h"

@implementation YYLabel (Attributed)

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent
{
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent];
    self.attributedText = attributedStr;
}


-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent
                 specialText:(NSString *)specialText
             specialTextFont:(id)specialTextFont
            specialTextColor:(UIColor *)specialTextColor
{
    NSParameterAssert(text);
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent specialText:specialText specialTextFont:specialTextFont specialTextColor:specialTextColor];
    self.attributedText = attributedStr;
}

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent
            specialTextArray:(NSArray<NSString *> *)specialTextArray
        specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
       specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
{
    NSParameterAssert(text);
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent specialTextArray:specialTextArray specialTextFontArray:specialTextFontArray specialTextColorArray:specialTextColorArray];
    self.attributedText = attributedStr;
}

//==============--默认字间距、行间距(一般单行使用，多行的话系统的行间距太小)-====================\\

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent
{
    return [self pp_attributedWithText:text font:font kern:-1 textColor:textColor lineSpacing:-1 textAligent:textAligent];
}

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent
                 specialText:(NSString *)specialText
             specialTextFont:(id)specialTextFont
            specialTextColor:(UIColor *)specialTextColor
{
    return [self pp_attributedWithText:text font:font kern:-1 textColor:textColor lineSpacing:-1 textAligent:textAligent specialText:specialText specialTextFont:specialTextFont specialTextColor:specialTextColor];
}

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent
            specialTextArray:(NSArray<NSString *> *)specialTextArray
        specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
       specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
{
    return [self pp_attributedWithText:text font:font kern:-1 textColor:textColor lineSpacing:-1 textAligent:textAligent specialTextArray:specialTextArray specialTextFontArray:specialTextFontArray specialTextColorArray:specialTextColorArray];
}


@end
