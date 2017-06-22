//
//  YYLabel+ConfigureAndCalculate.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YYText/YYText.h>

typedef void(^attributedStrBlock)(NSMutableAttributedString *attributedStr);
typedef void(^calculateBlock)(CGSize size,NSUInteger lineCount);

@interface YYLabel (ConfigureAndCalculate)

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


/**
 LB【复杂的】富文本设置 【block返回attributedStr】
 
 @param textColor 所有文字颜色
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型)【可以是字体大小（加粗的话B开头，如B12意味着bold）】
 @param lineSpacing 所有文字行间距
 @param specialTextColorArray 特殊字符颜色数组
 @param specialTextFontArray 特殊文字字体数组
 @param specialTextArray 特殊文字文字数组
 @param allStr 富文本文字
 @param attributedStrBlock 返回富文本block
 */
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                                font:(id)font
                         lineSpacing:(CGFloat)lineSpacing
               specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                    specialTextArray:(NSArray <NSString *>*)specialTextArray
                              allStr:(NSString *)allStr
                  attributedStrBlock:(attributedStrBlock)attributedStrBlock;

/*
 
 来自:YYTextLayout.h，有助于理解下面所需要传递的参数
 
 ┌─────────────────────────────┐  <------- container
 │                             │
 │    asdfasdfasdfasdfasdfa   <------------ container insets
 │    asdfasdfa   asdfasdfa    │
 │    asdfas         asdasd    │
 │    asdfa        <----------------------- container exclusion path
 │    asdfas         adfasd    │
 │    asdfasdfa   asdfasdfa    │
 │    asdfasdfasdfasdfasdfa    │
 │                             │
 └─────────────────────────────┘
 */
/**
 LB【复杂的】富文本设置 【block返回文字size 和 文字行数（numberLine = XX）】
 
 @param textColor 所有文字颜色
 @param font 所有文字大小(支持UIFont/NSNumber/NSString三种类型) 【可以是字体大小（加粗的话B开头，如B12意味着bold)】
 @param lineSpacing 所有文字行间距
 @param containerInsets 文字距离LB边界
 @param containerSize lb的size 【计算高 CGSizeMake(lbWidth, CGFLOAT_MAX);  计算宽（一般单行）：CGSizeMake(CGFLOAT_MAX, lbHeight);】
 @param specialTextColorArray 特殊字符颜色数组
 @param specialTextFontArray 特殊文字字体数组
 @param specialTextArray 特殊文字文字数组
 @param allStr 富文本文字
 @param calculateBlock 返回富文本计算block
 */
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                                font:(id)font
                         lineSpacing:(CGFloat)lineSpacing
                     containerInsets:(UIEdgeInsets)containerInsets
                       containerSize:(CGSize)containerSize
               specialTextColorArray:(NSArray <UIColor *>*)specialTextColorArray
                specialTextFontArray:(NSArray <UIFont *>*)specialTextFontArray
                    specialTextArray:(NSArray <NSString *>*)specialTextArray
                              allStr:(NSString *)allStr
                      calculateBlock:(calculateBlock)calculateBlock;

@end


//=============================
/*文字计算*/
//============================
@interface YYLabel (Calculate)
/**
 获取LB(文字)的size
 @param containerInsets   文字处于LB的insets，（参看上面引用YY的图更容易理解）
 @param containerSize     lb的size 【计算高 CGSizeMake(lbWidth, CGFLOAT_MAX);  计算宽（一般单
 行）：CGSizeMake(CGFLOAT_MAX, lbHeight);】
 @param text              需要展示上的文字 【支持的类型：NSAttributedString* NSString *】
 @param calculateBlock    计算完成回调
 */
-(void)LBCalculateWithContainerInsets:(UIEdgeInsets)containerInsets
                        containerSize:(CGSize)containerSize
                                 text:(id)text
                       calculateBlock:(calculateBlock)calculateBlock;

/**
 获取LB（文字）的size
 @param  注释参考上面，只是没有insets
 */
-(void)LBCalculateWithContainerSize:(CGSize)containerSize
                               text:(id)text
                     calculateBlock:(calculateBlock)calculateBlock;
@end
