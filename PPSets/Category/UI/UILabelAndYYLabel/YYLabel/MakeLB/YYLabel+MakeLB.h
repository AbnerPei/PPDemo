//
//  YYLabel+MakeLB.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (MakeLB)

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor;

//=========================-建议没有富文本的使用-================

/**
 YY创建lb 父视图 字体 文字颜色  
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型)【可以是字体大小（加粗的话B开头，如B12意味着bold）】
 */
+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     numberOfLines:(NSUInteger)numberOfLines;


+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
                   yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
                   yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
                     numberOfLines:(NSUInteger)numberOfLines;

//==========================-建议有富文本的使用-=======================
/** 因为attributedText一旦Set a new value to this property also replaces the value of the `text`, `font`, `textColor`,`textAlignment` and other properties in label.**/

+(instancetype)pp_lbMakeForAttributedWithSuperV:(UIView *)superV
                                        bgColor:(UIColor *)bgColor
                                  numberOfLines:(NSUInteger)numberOfLines;

+(instancetype)pp_lbMakeForAttributedWithSuperV:(UIView *)superV;

@end
