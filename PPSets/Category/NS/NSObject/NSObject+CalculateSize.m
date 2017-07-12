//
//  NSObject+CalculateSize.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSObject+CalculateSize.h"

@implementation NSObject (CalculateSize)
+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize
                                      text:(NSString *)text
                                      font:(id)font
                          calculateForType:(PPCalculateSizeForType)calculateForType

{
    NSParameterAssert(text);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringWithText:text];
        [UIFont pp_fontWithIdFont:font forAttributedStr:attributedStr];
        return [self pp_calculateSizeWithContainerSize:containerSize attributedStr:attributedStr calculateForType:PPCalculateSizeForTypeYYLabel];
    }
    if (calculateForType == PPCalculateSizeForTypeUILabel) {
        NSParameterAssert(font);
        NSDictionary *attributes = [UIFont pp_fontForAttributedStrWithIdFont:font];
        NSParameterAssert(attributes);
        CGSize textSize = [text boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
        return CGSizeMake(textSize.width, textSize.height+0.2);
    }
    return CGSizeZero;
}
+(CGSize)pp_calculatedSizeOneLineWithFont:(id)font
                         calculateForType:(PPCalculateSizeForType)calculateForType
{
    return [self pp_calculateSizeWithContainerSize:CGSizeMake(200, CGFLOAT_MAX) text:@"OneLine" font:font calculateForType:calculateForType];
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
        return CGSizeMake(textSize.width, textSize.height+0.2);
    }
    return CGSizeZero;
}

@end

@implementation NSObject (CalculateWidthOrHeight)

+(CGFloat)pp_calculateWidthWithFont:(id)font
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
+(CGFloat)pp_calculateHeightWithFont:(id)font width:(CGFloat)width text:(NSString *)text
{
    NSString *className = NSStringFromClass([self class]);
    if ([className isEqualToString:@"YYLable"]) {
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text font:font calculateForType:PPCalculateSizeForTypeYYLabel].height;
    }else{
        return [self pp_calculateSizeWithContainerSize:CGSizeMake(width, CGFLOAT_MAX) text:text font:font calculateForType:PPCalculateSizeForTypeUILabel].height;
    }
}

@end

@implementation NSObject (PPCalculate)

+(CGSize)pp_calculateSizeWithContainerSize:(CGSize)containerSize attributedStr:(NSMutableAttributedString *)attributedStr calculateForType:(PPCalculateSizeForType)calculateForType maxLine:(NSUInteger)maxLine
{
    NSParameterAssert(attributedStr);
    if (calculateForType == PPCalculateSizeForTypeYYLabel) {
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
        CGSize totalSize = textLayout.textBoundingSize;
        NSUInteger lineCount = textLayout.rowCount;
        CGSize oneSize = [self pp_calculatedSizeOneLineWithFont:attributedStr.yy_font calculateForType:calculateForType];
        if (maxLine != 0 && maxLine <= lineCount) {
            CGFloat lineSpacingCount = lineCount-1;
            CGFloat totalLineSpacingHeight = lineSpacingCount * attributedStr.yy_lineSpacing;
            CGFloat oneTextHeight = (totalSize.height-totalLineSpacingHeight)/lineCount+0.2;
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
