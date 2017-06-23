//
//  NSMutableAttributedString+EasilyMake.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSMutableAttributedString+EasilyMake.h"

@implementation NSMutableAttributedString (EasilyMake)
+(instancetype)pp_attributedStringWithText:(NSString *)text
{
    return [[self alloc]initWithString:text];
}
+(instancetype)pp_attributedStringWithText:(NSString *)text font:(id)font textColor:(UIColor *)textColor
{
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:text];
    [UIFont pp_fontWithIdFont:font forAttributedStr:attributedStr];
    if (textColor) {
        attributedStr.yy_color = textColor;
    }
    return attributedStr;
}
+(instancetype)pp_attributedStringWithText:(NSString *)text font:(id)font textColor:(UIColor *)textColor lineSpacing:(CGFloat)lineSpacing
{
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:text font:font textColor:textColor];
    if (lineSpacing >= 0) {
        attributedStr.yy_lineSpacing = lineSpacing;
    }
    return attributedStr;
}


+(instancetype)pp_attributedStringWithTextColor:(UIColor *)textColor
                                           font:(id)font
                                    lineSpacing:(CGFloat)lineSpacing
                               specialTextColor:(UIColor *)specialTextColor
                                specialTextFont:(id)specialTextFont
                                    specialText:(NSString *)specialText
                                         allStr:(NSString *)allStr
{
    
    //统配
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:allStr font:font textColor:textColor lineSpacing:lineSpacing];
    //特殊字符【字体】配置
    [UIFont pp_fontWithIdFont:specialTextFont forAttributedStr:attributedStr specailText:specialText];
    //特殊字符【颜色配置】
    [UIColor pp_colorWithSpecialColor:specialTextColor specialText:specialText forAttributedStr:attributedStr];
    
    return attributedStr;
    
}

#pragma mark ---
+(instancetype)pp_attributedStringWithTextColor:(UIColor *)textColor font:(id)font lineSpacing:(CGFloat)lineSpacing specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray specialTextArray:(NSArray<NSString *> *)specialTextArray allStr:(NSString *)allStr
{
    NSMutableAttributedString *attributedStr =
    [NSMutableAttributedString pp_attributedStringWithText:allStr
                                                      font:font
                                                 textColor:textColor
                                               lineSpacing:lineSpacing];
    
    if (specialTextArray.count > 0) {
        for (int i = 0; i<specialTextArray.count; i++) {
            NSString *aSpecialStr = specialTextArray[i];
            if (!aSpecialStr) { continue; }
            NSMutableArray *resultArrs = [self getOneSpecialTextRangeArrWithSpecialText:aSpecialStr allText:attributedStr.string];
            for (int j = 0; j<resultArrs.count; j++) {
                NSTextCheckingResult *result = resultArrs[j];
                if (specialTextColorArray.count > i) {
                    id aSpecialTextColor = specialTextColorArray[i];
                    if (aSpecialTextColor && [aSpecialTextColor isKindOfClass:[UIColor class]]) {
                        [attributedStr yy_setColor:aSpecialTextColor range:result.range];
                    }
                }
                if (specialTextFontArray.count > i) {
                    id aFont = specialTextFontArray[i];
                    if (aFont && [aFont isKindOfClass:[UIFont class]]) {
                        [attributedStr yy_setFont:aFont range:result.range];
                    }
                }
            }
            
        }
    }
    return attributedStr;
    
}
+(NSMutableArray <NSTextCheckingResult *>*)getOneSpecialTextRangeArrWithSpecialText:(NSString *)specialText allText:(NSString *)allText
{
    if (specialText.length == 0 || allText.length == 0) {
        return nil;
    }
    NSMutableArray *rangeArrs = [NSMutableArray array];
    NSRange totalRange = NSMakeRange(0, allText.length);
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:specialText options:(NSRegularExpressionCaseInsensitive) error:nil];
    [regularExpression enumerateMatchesInString:allText options:0 range:totalRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [rangeArrs addObject:result];
    }];
    
    return rangeArrs;
}

@end
