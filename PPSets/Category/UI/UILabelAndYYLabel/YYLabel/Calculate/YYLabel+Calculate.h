//
//  YYLabel+Calculate.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
#import <YYText/YYText.h>

@interface YYLabel (Calculate)
/**
 获取LB(文字)的size
 @param containerSize     lb的size 【计算高 CGSizeMake(lbWidth, CGFLOAT_MAX);  计算宽（一般单
 行）：CGSizeMake(CGFLOAT_MAX, lbHeight);】
 @param text              需要展示上的文字 【支持的类型：NSAttributedString* NSString *】
 @param calculateBlock    计算完成回调
 */
+(void)pp_calculateYYLabelWithContainerSize:(CGSize)containerSize
                                       text:(id)text
                             calculateBlock:(calculateBlock)calculateBlock;


/**
 获取LB(文字)的size,【有效行数：比如总共10行，但是不显示那么多，只显示4行】

 @param containerSize 同上
 @param lineSpace 行间距
 @param vaildLines 要显示的行数,0代表没有限制
 @param text 同上
 @param calculateBlock 同上
 */
+(void)pp_calculateYYLabelWithContainerSize:(CGSize)containerSize
                                lineSpacing:(CGFloat)lineSpace
                                 vaildLines:(NSUInteger)vaildLines
                                       text:(id)text
                             calculateBlock:(calculateBlock)calculateBlock;
@end
