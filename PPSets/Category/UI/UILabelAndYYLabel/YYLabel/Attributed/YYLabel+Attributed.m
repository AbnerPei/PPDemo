//
//  YYLabel+Attributed.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+Attributed.h"

@implementation YYLabel (Attributed)
#pragma mark --- LB【单一文本】富文本设置
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                        specialTextColor:(UIColor *)specialTextColor
                         specialTextFont:(id)specialTextFont
                             specialText:(NSString *)specialText
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent
{
    
    NSMutableAttributedString *attributedStr =
    [NSMutableAttributedString pp_attributedStringWithTextColor:textColor
                                                           font:font
                                                    lineSpacing:lineSpacing
                                               specialTextColor:specialTextColor
                                                specialTextFont:specialTextFont
                                                    specialText:specialText
                                                         allStr:allStr];
    
    self.attributedText = attributedStr;
    self.textAlignment = textAligent;
}

#pragma mark --- LB【复杂的】富文本设置
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                   specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
                    specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                        specialTextArray:(NSArray<NSString *> *)specialTextArray
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent
{
    
    NSMutableAttributedString *attributedStr =
    [NSMutableAttributedString pp_attributedStringWithTextColor:textColor
                                                           font:font
                                                    lineSpacing:lineSpacing
                                          specialTextColorArray:specialTextColorArray
                                           specialTextFontArray:specialTextFontArray
                                               specialTextArray:specialTextArray
                                                         allStr:allStr];
    
    self.attributedText = attributedStr;
    self.textAlignment = textAligent;
}


#pragma mark --- LB【复杂的】富文本设置 【block返回文字size 和 文字行数（numberLine = XX）】
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                           containerSize:(CGSize)containerSize
                   specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
                    specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                        specialTextArray:(NSArray<NSString *> *)specialTextArray
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent
                          calculateBlock:(calculateBlock)calculateBlock
{
    NSMutableAttributedString *attributedStr =
    [NSMutableAttributedString pp_attributedStringWithTextColor:textColor
                                                           font:font
                                                    lineSpacing:lineSpacing
                                          specialTextColorArray:specialTextColorArray
                                           specialTextFontArray:specialTextFontArray
                                               specialTextArray:specialTextArray
                                                         allStr:allStr];
    
    self.attributedText = attributedStr;
    self.textAlignment = textAligent;
    
    [YYLabel pp_calculateYYLabelWithContainerSize:containerSize
                                             text:attributedStr
                                   calculateBlock:calculateBlock];
    
}
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor font:(id)font lineSpacing:(CGFloat)lineSpacing containerSize:(CGSize)containerSize specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray specialTextArray:(NSArray<NSString *> *)specialTextArray allStr:(NSString *)allStr textAligent:(NSTextAlignment)textAligent vaildLines:(NSUInteger)vaildLines calculateBlock:(calculateBlock)calculateBlock
{
    NSMutableAttributedString *attributedStr =
    [NSMutableAttributedString pp_attributedStringWithTextColor:textColor
                                                           font:font
                                                    lineSpacing:lineSpacing
                                          specialTextColorArray:specialTextColorArray
                                           specialTextFontArray:specialTextFontArray
                                               specialTextArray:specialTextArray
                                                         allStr:allStr];
    
    self.attributedText = attributedStr;
    self.textAlignment = textAligent;
    
    [YYLabel pp_calculateYYLabelWithContainerSize:containerSize
                                      lineSpacing:lineSpacing
                                       vaildLines:vaildLines
                                             text:attributedStr
                                   calculateBlock:calculateBlock];
}

@end
