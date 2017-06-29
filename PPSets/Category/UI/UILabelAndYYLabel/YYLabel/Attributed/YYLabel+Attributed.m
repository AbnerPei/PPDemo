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
    [self pp_attributedWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent specialText:nil specialTextFont:nil specialTextColor:nil];
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


@end
