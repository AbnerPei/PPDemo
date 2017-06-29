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
