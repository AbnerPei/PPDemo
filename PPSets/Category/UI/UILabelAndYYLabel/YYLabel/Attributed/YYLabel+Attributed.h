//
//  YYLabel+Attributed.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (Attributed)

/**
 (NSMutableAttributedString *)初始化。【整体】
 @param text 【整体】文字
 @param font 【整体】字体
 @param kern 【整体】文字横间距
 @param textColor 【整体】文字颜色
 @param lineSpacing 【整体】文字行间距
 @param textAligent 【整体】文字对齐方式
 */
-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent;


-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent
                 specialText:(NSString *)specialText
             specialTextFont:(id)specialTextFont
            specialTextColor:(UIColor *)specialTextColor;

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                        kern:(CGFloat)kern
                   textColor:(UIColor *)textColor
                 lineSpacing:(CGFloat)lineSpacing
                 textAligent:(NSTextAlignment)textAligent
            specialTextArray:(NSArray<NSString *> *)specialTextArray
        specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
       specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray;


//==============--默认字间距、行间距(一般单行使用，多行的话系统的行间距太小)-====================\\

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent;


-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent
                 specialText:(NSString *)specialText
             specialTextFont:(id)specialTextFont
            specialTextColor:(UIColor *)specialTextColor;

-(void)pp_attributedWithText:(NSString *)text
                        font:(id)font
                   textColor:(UIColor *)textColor
                 textAligent:(NSTextAlignment)textAligent
            specialTextArray:(NSArray<NSString *> *)specialTextArray
        specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
       specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray;

@end
