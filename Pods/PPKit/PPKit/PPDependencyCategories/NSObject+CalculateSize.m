//
//  NSObject+CalculateSize.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSObject+CalculateSize.h"
#import "UIFont+EasySetToXX.h"
#import "NSMutableAttributedString+EasilyMake.h"
#import "YYText.h"

@implementation NSObject (CalculateSize)
+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                                      text:(NSString *)text
                                      font:(UIFont *)font
                          calculateForType:(PPCalculateSizeForType)calculateForType

{
    NSParameterAssert(text);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text];
        [UIFont pp_fontSetFont:font forAttributedStr:attributedStr];
        return [self pp_calculateSizeWithContainerSize:containerSize attributedStr:attributedStr calculateForType:PPCalculateSizeForTypeYYLabel];
    }
    if (calculateForType == PPCalculateSizeForTypeUILabel) {
        NSParameterAssert(font);
        NSDictionary *attributes = [UIFont pp_fontSetForBoundingAttributesWithFont:font];
        NSParameterAssert(attributes);
        CGSize textSize = [text boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        return CGSizeMake(textSize.width, textSize.height);
    }
    return CGSizeZero;
}
+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                                      text:(NSString *)text
                                   fontStr:(NSString *)fontStr
                          calculateForType:(PPCalculateSizeForType)calculateForType
{
    NSParameterAssert(text);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text];
        [UIFont pp_fontSetWithSpecifiedFontStr:fontStr forAttributedStr:attributedStr];
        return [self pp_calculateSizeWithContainerSize:containerSize attributedStr:attributedStr calculateForType:PPCalculateSizeForTypeYYLabel];
    }
    if (calculateForType == PPCalculateSizeForTypeUILabel) {
        NSParameterAssert(fontStr);
        NSDictionary *attributes = [UIFont pp_fontSetForBoundingAttributesWithSpecifiedFontStr:fontStr];
        NSParameterAssert(attributes);
        CGSize textSize = [text boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        return CGSizeMake(textSize.width, textSize.height);
    }
    return CGSizeZero;
}
+(CGSize)pp_calculateSizeOneLineWithFont:(UIFont *)font
                         calculateForType:(PPCalculateSizeForType)calculateForType
{
    return [self pp_calculateSizeWithContainerSize:CGSizeMake(200, CGFLOAT_MAX) text:@"OneLine" font:font calculateForType:calculateForType];
}
+(CGSize)pp_calculateSizeOneLineWithFontStr:(NSString *)fontStr calculateForType:(PPCalculateSizeForType)calculateForType
{
    return [self pp_calculateSizeWithContainerSize:CGSizeMake(200, CGFLOAT_MAX) text:@"OneLine" fontStr:fontStr calculateForType:calculateForType];
}

+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize attributedStr:(NSMutableAttributedString *)attributedStr calculateForType:(PPCalculateSizeForType)calculateForType
{
    NSParameterAssert(attributedStr);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
        /*
         textBoundingRect  文字的frame（只有文字）
         textBoundingSize  容器size，包含边界
         */
        CGSize textSize = textLayout.textBoundingSize;
        return CGSizeMake(textSize.width, textSize.height+0.2);
    }
    
    if (calculateForType == PPCalculateSizeForTypeUILabel) {
        CGSize textSize = [attributedStr boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        return CGSizeMake(textSize.width, textSize.height);
    }
    return CGSizeZero;
}

@end

@implementation NSObject (CalculateWidthOrHeight)

+(CGFloat)pp_calculateWidthWithFont:(UIFont *)font
                             height:(CGFloat)height
                               text:(NSString *)text
{
    NSString *className = NSStringFromClass([self class]);
    if ([className isEqualToString:@"YYLable"]) {
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(CGFLOAT_MAX, height) text:text font:font calculateForType:PPCalculateSizeForTypeYYLabel].width;
    }else{
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(CGFLOAT_MAX, height) text:text font:font calculateForType:PPCalculateSizeForTypeUILabel].width;
    }
}
+(CGFloat)pp_calculateWidthWithSpecifiedFontStr:(NSString *)fontStr
                                         height:(CGFloat)height
                                           text:(NSString *)text
{
    NSString *className = NSStringFromClass([self class]);
    if ([className isEqualToString:@"YYLable"]) {
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(CGFLOAT_MAX, height) text:text fontStr:fontStr calculateForType:PPCalculateSizeForTypeYYLabel].width;
    }else{
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(CGFLOAT_MAX, height) text:text fontStr:fontStr calculateForType:PPCalculateSizeForTypeUILabel].width;
    }
}
+(CGFloat)pp_calculateHeightWithFont:(UIFont *)font
                               width:(CGFloat)width
                                text:(NSString *)text
{
    NSString *className = NSStringFromClass([self class]);
    if ([className isEqualToString:@"YYLable"]) {
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text font:font calculateForType:PPCalculateSizeForTypeYYLabel].height;
    }else{
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text font:font calculateForType:PPCalculateSizeForTypeUILabel].height;
    }
}
+(CGFloat)ppcalculateHeightWithFontStr:(NSString *)fontStr
                                 width:(CGFloat)width
                                  text:(NSString *)text
{
    NSString *className = NSStringFromClass([self class]);
    if ([className isEqualToString:@"YYLable"]) {
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text fontStr:fontStr calculateForType:PPCalculateSizeForTypeYYLabel].height;
    }else{
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text fontStr:fontStr calculateForType:PPCalculateSizeForTypeUILabel].height;
    }
}

@end

@implementation NSObject (PPCalculate)

+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                             attributedStr:(NSMutableAttributedString *)attributedStr
                          calculateForType:(PPCalculateSizeForType)calculateForType
                                   maxLine:(NSUInteger)maxLine
{
    NSParameterAssert(attributedStr);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
        CGSize totalSize = textLayout.textBoundingSize;
        NSUInteger lineCount = textLayout.rowCount;
        if (maxLine != 0 && maxLine <= lineCount) {
            CGFloat lineSpacingCount = lineCount-1;
            CGFloat totalLineSpacingHeight = lineSpacingCount * attributedStr.yy_lineSpacing;
            CGFloat oneTextHeight = (totalSize.height-totalLineSpacingHeight)/lineCount;
            CGFloat needHeight = oneTextHeight*maxLine+(maxLine-1)*attributedStr.yy_lineSpacing;
            return CGSizeMake(containerSize.width, needHeight);
        }else{
            return totalSize;
        }
    }
    
    if (calculateForType == PPCalculateSizeForTypeUILabel) {
        NSAssert(0, @"%s UILabe的限制行数计算，就不用再算了，调用sizeWithFont就可以啦",__func__);
    }
    
    return CGSizeZero;
}

@end
