//
//  NSObject+CalculateSize.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PPCalculate;

typedef NS_ENUM(NSInteger,PPCalculateSizeForType) {
    PPCalculateSizeForTypeYYLabel = 1,
    PPCalculateSizeForTypeUILabel
};

@interface NSObject (CalculateSize)

/**
 计算(NSString *)字符串size.  YYLabel用YYTextLayout；UILabel用boundingRectWithSize。

 @param containerSize 给定的containerSize
 @param text 文字
 @param font 文字字体
 @param calculateForType YYLabel or UILabel
 */
+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                                      text:(NSString *)text
                                      font:(id)font
                          calculateForType:(PPCalculateSizeForType)calculateForType;

+(CGSize)pp_calculatedSizeOneLineWithFont:(id)font
                         calculateForType:(PPCalculateSizeForType)calculateForType;

/**
 计算(NSMutableAttributedString *)字符串size.  YYLabel用YYTextLayout；UILabel用boundingRectWithSize。

 @param containerSize 给定的containerSize
 @param atteibutedStr 富文本
 @param calculateForType YYLabel or UILabel
 */
+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                             attributedStr:(NSMutableAttributedString *)attributedStr
                          calculateForType:(PPCalculateSizeForType)calculateForType;


@end


@interface NSObject (CalculateWidthOrHeight)


/**
 计算文字宽 【建议用YYLabel或者UILabel来调用】【默认是YYLabel】
 
 @param font 字体  只接受NSNumber/NSString/NSMutableAttributedString三种类型
 @param height 给定的高度
 @param text 文字
 */
+(CGFloat)pp_calculateWidthWithFont:(id)font
                             height:(CGFloat)height
                               text:(NSString *)text;

/**
 计算文字高 【建议用YYLabel或者UILabel来调用】【默认是YYLabel】
 
 @param font 字体  只接受NSNumber/NSString/NSMutableAttributedString三种类型
 @param width 给定的高度
 @param text 文字
 */
+(CGFloat)pp_calculateHeightWithFont:(id)font
                               width:(CGFloat)width
                                text:(NSString *)text;

@end 

@interface NSObject (PPCalculate)

+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                                    attributedStr:(NSMutableAttributedString *)attributedStr
                                 calculateForType:(PPCalculateSizeForType)calculateForType
                                          maxLine:(NSUInteger)maxLine;
@end

@interface PPCalculate : NSObject
/** 文字整体总size */
@property(nonatomic,assign,readonly)CGSize totalSize;
/** 文字行数 */
@property(nonatomic,assign,readonly)NSUInteger lineCount;
/** 允许显示的最大size */
@property(nonatomic,assign,readonly)CGSize maxShowSize;
@end
