//
//  UILabel+CreatWithYYLabel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYText.h"

@interface UILabel (CreatWithYYLabel)

/** YY创建lb 字体大小 是否加粗 文字颜色 左右对齐方式 上下对齐方式 父视图*/
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize
                    isBold:(BOOL)isBold
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment
           yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
                 andSuperV:(UIView *)superV;

/** YY创建lb 字体大小 【不加粗】 文字颜色 左右对齐方式 上下对齐方式 父视图*/
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment
           yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
                 andSuperV:(UIView *)superV;

/** YY创建lb 字体大小 【不加粗】 文字颜色 左右对齐方式 【上下居中】 父视图*/
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment
                 andSuperV:(UIView *)superV;




@end
