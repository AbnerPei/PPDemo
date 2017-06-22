//
//  YYLabel+ConfigureAndCalculate.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+ConfigureAndCalculate.h"

@implementation YYLabel (ConfigureAndCalculate)
#pragma mark --- LB【单一文本】富文本设置
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor fontSize:(CGFloat)fontSize specialTextColor:(UIColor *)specialTextColor specialTextFontSize:(CGFloat)specialTextFontSize specialText:(NSString *)specialText attributedStr:(NSMutableAttributedString *)attributedStr
{
    if (!attributedStr) {
        return;
    }
    if (textColor) {
        attributedStr.yy_color = textColor;
    }
    if (fontSize >= 0) {
        attributedStr.yy_font = [UIFont systemFontOfSize:fontSize];
    }
    if (specialText.length > 0 && [attributedStr.string containsString:specialText]) {
        NSRange specialRange = [attributedStr.string rangeOfString:specialText];
        if (specialTextColor) {
            [attributedStr yy_setColor:specialTextColor range:specialRange];
        }
        if (specialTextFontSize >= 0) {
            [attributedStr yy_setFont:[UIFont systemFontOfSize:specialTextFontSize] range:specialRange];
        }
        
    }
    
    self.attributedText = attributedStr;
}

#pragma mark --- LB【复杂的】富文本设置 【block返回attributedStr】
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                                font:(id)font
                         lineSpacing:(CGFloat)lineSpacing
               specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
                specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                    specialTextArray:(NSArray<NSString *> *)specialTextArray
                              allStr:(NSString *)allStr
                  attributedStrBlock:(attributedStrBlock)attributedStrBlock
{
    if (!allStr || allStr.length == 0) { return; }
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    //设置总体的配置
    if (textColor) { attributedStr.yy_color = textColor;}
    
    if (font) {
        if ([font isKindOfClass:[UIFont class]]) {
            attributedStr.yy_font = font;
        }else if ([font isKindOfClass:[NSString class]]){
            NSString *fontStr = (NSString *)font;
            if ([fontStr hasPrefix:@"B"] && fontStr.length > 2) {
                NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
                CGFloat fontSize = [secondStr floatValue];
                if (fontSize >= 0) {
                    attributedStr.yy_font = [UIFont boldSystemFontOfSize:fontSize];
                }
            }else{
                CGFloat fontSize = [fontStr floatValue];
                if (fontSize >= 0) {
                    attributedStr.yy_font = [UIFont systemFontOfSize:fontSize];
                }
            }
        }else if ([font isKindOfClass:[NSNumber class]]){
            NSNumber *fontSizeN = (NSNumber *)font;
            CGFloat fontSizeF =  [fontSizeN floatValue];
            attributedStr.yy_font = [UIFont systemFontOfSize:fontSizeF];
        }else{
            NSLog(@"PP警告：您传入的font类型不是我们约定的，请检查后再试！！！");
        }
    }
    
    if (lineSpacing >= 0) { attributedStr.yy_lineSpacing = lineSpacing;}
    
    if (specialTextArray.count > 0) {
        for (int i = 0; i<specialTextArray.count; i++) {
            NSString *aSpecialStr = specialTextArray[i];
            if (!aSpecialStr) { continue; }
            NSMutableArray *resultArrs = [self getOneSpecialTextRangeArrWithSpecialText:aSpecialStr allText:attributedStr.string];
            for (int j = 0; j<resultArrs.count; j++) {
                NSTextCheckingResult *result = resultArrs[j];
                if (specialTextColorArray.count > i) {
                    id aSpecialTextColor = specialTextColorArray[i];
                    if (aSpecialTextColor && [aSpecialTextColor isKindOfClass:[UIColor class]]) {
                        [attributedStr yy_setColor:aSpecialTextColor range:result.range];
                    }
                }
                if (specialTextFontArray.count > i) {
                    id aFont = specialTextFontArray[i];
                    if (aFont && [aFont isKindOfClass:[UIFont class]]) {
                        [attributedStr yy_setFont:aFont range:result.range];
                    }
                }
            }
            
        }
        self.attributedText = attributedStr;
        attributedStrBlock(attributedStr);
    }
    
    
}

-(NSMutableArray <NSTextCheckingResult *>*)getOneSpecialTextRangeArrWithSpecialText:(NSString *)specialText allText:(NSString *)allText
{
    if (specialText.length == 0 || allText.length == 0) {
        return nil;
    }
    NSMutableArray *rangeArrs = [NSMutableArray array];
    NSRange totalRange = NSMakeRange(0, allText.length);
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:specialText options:(NSRegularExpressionCaseInsensitive) error:nil];
    [regularExpression enumerateMatchesInString:allText options:0 range:totalRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        [rangeArrs addObject:result];
    }];
    
    return rangeArrs;
}

#pragma mark --- LB【复杂的】富文本设置 【block返回文字size 和 文字行数（numberLine = XX）】
-(void)LBAttributedTextWithTextColor:(UIColor *)textColor
                                font:(id)font
                         lineSpacing:(CGFloat)lineSpacing
                     containerInsets:(UIEdgeInsets)containerInsets
                       containerSize:(CGSize)containerSize
               specialTextColorArray:(NSArray<UIColor *> *)specialTextColorArray
                specialTextFontArray:(NSArray<UIFont *> *)specialTextFontArray
                    specialTextArray:(NSArray<NSString *> *)specialTextArray
                              allStr:(NSString *)allStr
                      calculateBlock:(calculateBlock)calculateBlock
{
    [self LBAttributedTextWithTextColor:textColor
                                   font:font
                            lineSpacing:lineSpacing
                  specialTextColorArray:specialTextColorArray
                   specialTextFontArray:specialTextFontArray
                       specialTextArray:specialTextArray
                                 allStr:allStr
                     attributedStrBlock:^(NSMutableAttributedString *attributedStr) {
                         [self LBCalculateWithContainerInsets:containerInsets
                                                containerSize:containerSize
                                                         text:allStr
                                               calculateBlock:calculateBlock];
                     }];
}



@end

@implementation YYLabel (Calculate)

#pragma mark --- 获取LB(文字)的size
-(void)LBCalculateWithContainerInsets:(UIEdgeInsets)containerInsets
                        containerSize:(CGSize)containerSize
                                 text:(id)text
                       calculateBlock:(calculateBlock)calculateBlock
{
    
    if (!text) { return; }
    NSMutableAttributedString *attributedStr;
    if ([text isKindOfClass:[NSAttributedString class]]) {
        attributedStr = (NSMutableAttributedString *)text;
        if (attributedStr.string.length == 0) {
            return;
        }
    }else if ([text isKindOfClass:[NSString class]]){
        NSString *textStr = (NSString *)text;
        if (textStr.length == 0) {
            return;
        }
        attributedStr = [[NSMutableAttributedString alloc]initWithString:textStr];
    }else{
        NSLog(@"PP警告：你传入的类型不是我想要的(NSAttributedString* NSString *)，请仔细看.h中文件类型");
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize insets:containerInsets];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
        /*
         textBoundingRect  文字的frame（只有文字）
         textBoundingSize  容器size，包含边界
         */
        CGSize textSize = textLayout.textBoundingSize;
        NSUInteger lineCount = textLayout.rowCount;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            calculateBlock(textSize,lineCount);
        });
    });
    
}

-(void)LBCalculateWithContainerSize:(CGSize)containerSize
                               text:(id)text
                     calculateBlock:(calculateBlock)calculateBlock
{
    [self LBCalculateWithContainerInsets:UIEdgeInsetsZero
                           containerSize:containerSize
                                    text:text
                          calculateBlock:calculateBlock];
}

@end
