//
//  NSMutableAttributedString+EasilyMake.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (EasilyMake)

+(instancetype)pp_attributedStringWithText:(NSString *)text;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(id)font
                                 textColor:(UIColor *)textColor;

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(id)font
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing;

+(instancetype)pp_attributedStringWithTextColor:(UIColor *)textColor
                                           font:(id)font
                                    lineSpacing:(CGFloat)lineSpacing
                               specialTextColor:(UIColor *)specialTextColor
                                specialTextFont:(id)specialTextFont
                                    specialText:(NSString *)specialText
                                         allStr:(NSString *)allStr;


+(instancetype)pp_attributedStringWithTextColor:(UIColor *)textColor
                                           font:(id)font
                                    lineSpacing:(CGFloat)lineSpacing
                          specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
                           specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                               specialTextArray:(NSArray<NSString *> *)specialTextArray
                                         allStr:(NSString *)allStr;


@end
