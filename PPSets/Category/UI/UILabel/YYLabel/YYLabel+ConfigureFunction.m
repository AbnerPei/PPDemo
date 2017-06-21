//
//  YYLabel+ConfigureFunction.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+ConfigureFunction.h"

@implementation YYLabel (ConfigureFunction)

#pragma mark --- LB【单一文本】富文本设置
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor fontSize:(CGFloat)fontSize specialTextColor:(UIColor *)specialTextColor specialTextFontSize:(CGFloat)specialTextFontSize specialText:(NSString *)specialText attributedStr:(NSMutableAttributedString *)attributedStr
{
    if (!attributedStr) {
        return;
    }
    if (textColor) {
        attributedStr.yy_color = textColor;
    }
    if (fontSize >= 0) {
        attributedStr.yy_font = [UIFont systemFontOfSize:fontSize];
    }
    if (specialText.length > 0 && [attributedStr.string containsString:specialText]) {
        NSRange specialRange = [attributedStr.string rangeOfString:specialText];
        if (specialTextColor) {
            [attributedStr yy_setColor:specialTextColor range:specialRange];
        }
        if (specialTextFontSize >= 0) {
            [attributedStr yy_setFont:[UIFont systemFontOfSize:specialTextFontSize] range:specialRange];
        }
        
    }
    
    self.attributedText = attributedStr;
}

#pragma mark --- LB【复杂的】富文本设置
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor font:(UIFont *)font specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray specialTextArray:(NSArray<NSString *> *)specialTextArray attributedStr:(NSMutableAttributedString *)attributedStr
{
    if (!attributedStr || attributedStr.string.length == 0) {
        return;
    }
    if (textColor) {
        attributedStr.yy_color = textColor;
    }
    if (font) {
        attributedStr.yy_font = font;
    }
    if (specialTextArray.count > 0) {
        for (int i = 0; i<specialTextArray.count; i++) {
            NSString *aSpecialStr = specialTextArray[i];
            if (!aSpecialStr) {
                continue;
            }
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
        self.attributedText = attributedStr;
    }
    
    
}

-(NSMutableArray <NSTextCheckingResult *>*)getOneSpecialTextRangeArrWithSpecialText:(NSString *)specialText allText:(NSString *)allText
{
    if (specialText.length == 0 || allText.length == 0) {
        return nil;
    }
    NSMutableArray *rangeArrs = [NSMutableArray array];
    NSRange totalRange = NSMakeRange(0, allText.length);
//    NSRange validRange = [allText paragraphRangeForRange:totalRange];
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:specialText options:(NSRegularExpressionCaseInsensitive) error:nil];
    [regularExpression enumerateMatchesInString:allText options:0 range:totalRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [rangeArrs addObject:result];
    }];
    
    return rangeArrs;
}


@end
