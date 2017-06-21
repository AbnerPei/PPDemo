//
//  YYLabel+ConfigureFunction.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (ConfigureFunction)
/**
 LB【单一文本】富文本设置
 @param textColor 所有文字颜色
 @param fontSize 所有文字大小
 @param specialTextColor 特殊字符颜色
 @param specialTextFontSize 特殊文字大小
 @param specialText 特殊文字
 @param atributedStr 富文本文字
 */
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                            fontSize:(CGFloat)fontSize
                    specialTextColor:(UIColor *)specialTextColor
                 specialTextFontSize:(CGFloat)specialTextFontSize
                         specialText:(NSString *)specialText
                       attributedStr:(NSMutableAttributedString *)attributedStr;

//-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
//                    specialTextColor:(UIColor *)specialTextColor
//                         specialText:(NSString *)specialText
//                       attributedStr:(NSAttributedString *)ttributedStr;


/**
 LB【复杂的】富文本设置
 
 @param textColor 所有文字颜色
 @param font 所有文字大小
 @param specialTextColorArray 特殊字符颜色数组
 @param specialTextFontArray 特殊文字字体数组
 @param specialTextArray 特殊文字文字数组
 @param atributedStr 富文本文字
 */
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                                font:(UIFont *)font
               specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                    specialTextArray:(NSArray <NSString *>*)specialTextArray
                       attributedStr:(NSMutableAttributedString *)attributedStr;
@end
