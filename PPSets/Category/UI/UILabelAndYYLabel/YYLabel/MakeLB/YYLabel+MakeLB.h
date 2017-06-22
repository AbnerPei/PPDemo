//
//  YYLabel+MakeLB.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYLabel (MakeLB)
/**
 YY创建lb font 文字颜色 左右对齐方式 上下对齐方式 父视图
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型)【可以是字体大小（加粗的话B开头，如B12意味着bold）】
 */
+(YYLabel *)LBWithFont:(id)font
             textColor:(UIColor *)textColor
         textAlignment:(NSTextAlignment)textAlignment
       yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
             andSuperV:(UIView *)superV;

/**
 YY创建lb font 文字颜色 左右对齐方式 【上下居中】 父视图
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型)【可以是字体大小（加粗的话B开头，如B12意味着bold）】
 */
+(YYLabel *)LBWithFont:(id)font
             textColor:(UIColor *)textColor
         textAlignment:(NSTextAlignment)textAlignment
             andSuperV:(UIView *)superV;
@end
