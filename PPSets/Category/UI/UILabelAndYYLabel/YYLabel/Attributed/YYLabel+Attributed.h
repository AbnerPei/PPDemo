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
 LB【单一文本】富文本设置 【无返回】  【一个字符串中只有某一个特殊的字符串需要处理的情况】
 @param textColor 所有文字颜色
 @param fontSize 所有文字大小
 @param specialTextColor 特殊字符颜色
 @param specialTextFontSize 特殊文字大小
 @param specialText 特殊文字
 @param atributedStr 富文本文字
 @param textAligent 最有对齐方式【因为设置atributedStr，会重置LB已有的属性设置】
 */
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                        specialTextColor:(UIColor *)specialTextColor
                         specialTextFont:(id)specialTextFont
                             specialText:(NSString *)specialText
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent;


/**
 LB【复杂的】富文本设置
 
 @param textColor 所有文字颜色
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型)【可以是字体大小（加粗的话B开头，如B12意味着bold）】
 @param lineSpacing 所有文字行间距
 @param specialTextColorArray 特殊字符颜色数组
 @param specialTextFontArray 特殊文字字体数组
 @param specialTextArray 特殊文字文字数组
 @param allStr 富文本文字
 @param textAligent 最有对齐方式【因为设置atributedStr，会重置LB已有的属性设置】
 */
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                   specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                    specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                        specialTextArray:(NSArray <NSString *>*)specialTextArray
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent;



/**
 LB【复杂的】富文本设置 【不NO限制文字行数】 【block返回文字size 和 文字行数（numberLine = XX）】
 
 @param textColor 所有文字颜色
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型) 【可以是字体大小（加粗的话B开头，如B12意味着bold)】
 @param lineSpacing 所有文字行间距
 @param containerSize lb的size 【计算高 CGSizeMake(lbWidth, CGFLOAT_MAX);  计算宽（一般单行）：CGSizeMake(CGFLOAT_MAX, lbHeight);】
 @param specialTextColorArray 特殊字符颜色数组
 @param specialTextFontArray 特殊文字字体数组
 @param specialTextArray 特殊文字文字数组
 @param allStr 富文本文字
 @param textAligent 最有对齐方式【因为设置atributedStr，会重置LB已有的属性设置】
 @param calculateBlock 返回富文本计算block
 */
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                           containerSize:(CGSize)containerSize
                   specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                    specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                        specialTextArray:(NSArray <NSString *>*)specialTextArray
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent
                          calculateBlock:(calculateBlock)calculateBlock;

/**
 LB【复杂的】富文本设置 【限制文字行数】 【block返回文字size 和 文字行数（numberLine = XX）】
 @param vaildLines 要显示的行数,0代表没有限制
 @param 其它同上
 */
-(void)pp_attributedYYLabelWithTextColor:(UIColor *)textColor
                                    font:(id)font
                             lineSpacing:(CGFloat)lineSpacing
                           containerSize:(CGSize)containerSize
                   specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                    specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                        specialTextArray:(NSArray <NSString *>*)specialTextArray
                                  allStr:(NSString *)allStr
                             textAligent:(NSTextAlignment)textAligent
                              vaildLines:(NSUInteger)vaildLines
                          calculateBlock:(calculateBlock)calculateBlock;
@end
