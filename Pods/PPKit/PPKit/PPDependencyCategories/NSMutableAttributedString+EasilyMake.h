//
//  NSMutableAttributedString+EasilyMake.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (EasilyMake)


/** (NSMutableAttributedString *)初始化。 */
+(instancetype)pp_attributedStringWithText:(NSString *)text;

/**
 (NSMutableAttributedString *)初始化。【整体】
 @param text 【整体】文字
 @param font 【整体】字体
 @param kern 【整体】文字横间距  {大于0有效}
 @param textColor 【整体】文字颜色
 @param lineSpacing 【整体】文字行间距  {大于0有效}
 @param textAligent 【整体】文字对齐方式
 */
+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent
                               specialText:(NSString *)specialText
                           specialTextFont:(NSString *)specialTextFont
                          specialTextColor:(UIColor *)specialTextColor;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent
                          specialTextArray:(NSArray<NSString *> *)specialTextArray
                      specialTextFontArray:(NSArray<NSString *> *)specialTextFontArray
                     specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray;


//===================-默认字间距、行间距(一般单行使用，多行的话系统的行间距太小)-====================\\

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                 textColor:(UIColor *)textColor
                               textAligent:(NSTextAlignment)textAligent;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                 textColor:(UIColor *)textColor
                               textAligent:(NSTextAlignment)textAligent
                               specialText:(NSString *)specialText
                           specialTextFont:(NSString *)specialTextFont
                          specialTextColor:(UIColor *)specialTextColor;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(NSString *)font
                                 textColor:(UIColor *)textColor
                               textAligent:(NSTextAlignment)textAligent
                          specialTextArray:(NSArray<NSString *> *)specialTextArray
                      specialTextFontArray:(NSArray<NSString *> *)specialTextFontArray
                     specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray;
@end
