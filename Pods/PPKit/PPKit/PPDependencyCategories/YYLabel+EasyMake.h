//
//  YYLabel+EasyMake.h
//  PPKitExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (EasyMake)

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor;

//=========================-建议没有富文本的使用-================

/**
 YY创建lb 父视图 字体 文字颜色
 @param font 参考：#import "UIFont+EasySetToXX.h"
 */
+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
                         textColor:(UIColor *)textColor;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
                         textColor:(UIColor *)textColor
                     numberOfLines:(NSUInteger)numberOfLines;


+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
                   yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment;

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
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

@interface YYLabel (EasyConfigure)
-(void)pp_lbSetTextColor:(UIColor *)textColor;
-(void)pp_lbSetFont:(UIFont *)font;
-(void)pp_lbSetFontStr:(NSString *)fontStr;
@end
