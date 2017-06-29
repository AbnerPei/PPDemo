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
/**
 (NSMutableAttributedString *)初始化。【整体】
 @param text 【整体】文字
 @param font 【整体】字体
 @param kern 【整体】文字横间距
 @param textColor 【整体】文字颜色
 @param lineSpacing 【整体】文字行间距
 @param textAligent 【整体】文字对齐方式
 */
+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(id)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent
{
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:text];
    [UIFont pp_fontWithIdFont:font forAttributedStr:attributedStr];
    [UIColor pp_colorWithTextColor:textColor forAttributedStr:attributedStr];
    if (lineSpacing < 0) { lineSpacing = 0; }
    if (kern < 0) { kern = 0; }
    attributedStr.yy_kern = [NSNumber numberWithFloat:kern];
    attributedStr.yy_lineSpacing = lineSpacing;
    attributedStr.yy_alignment = textAligent;
    return attributedStr;
}

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(id)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent
                               specialText:(NSString *)specialText
                           specialTextFont:(id)specialTextFont
                          specialTextColor:(UIColor *)specialTextColor
{
    //统配
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent];
    //特殊字符【字体】配置
    [UIFont pp_fontWithIdFont:specialTextFont forAttributedStr:attributedStr specailText:specialText];
    //特殊字符【颜色配置】
    [UIColor pp_colorWithSpecialColor:specialTextColor specialText:specialText forAttributedStr:attributedStr];
    return attributedStr;
}

+(instancetype)pp_attributedStringWithText:(NSString *)text
                                      font:(id)font
                                      kern:(CGFloat)kern
                                 textColor:(UIColor *)textColor
                               lineSpacing:(CGFloat)lineSpacing
                               textAligent:(NSTextAlignment)textAligent
                          specialTextArray:(NSArray<NSString *> *)specialTextArray
                      specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                     specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
{
    NSMutableAttributedString *attributedStr = [self pp_attributedStringWithText:text font:font kern:kern textColor:textColor lineSpacing:lineSpacing textAligent:textAligent];
    
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
