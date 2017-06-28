//
//  YYLabel+Calculate.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+Calculate.h"

@implementation YYLabel (Calculate)
#pragma mark --- 获取LB(文字)的size
+(void)pp_calculateYYLabelWithContainerSize:(CGSize)containerSize
                                       text:(id)text
                             calculateBlock:(calculateBlock)calculateBlock
{
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringHandleWithIdText:text];
    if (!attributedStr) {
        return;
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
        /*
         textBoundingRect  文字的frame（只有文字）
         textBoundingSize  容器size，包含边界
         */
        CGSize textSize = textLayout.textBoundingSize;
        NSUInteger lineCount = textLayout.rowCount;
        
        //说明，因为高度如果去textSize.height，可能是73.000810，结果系统处理后就是73.00080，这样，就造成lb要显示的content变下，文字显示不全，截取一部分，所以要对这个高度，向上进1取整。
        CGSize vaildSize = CGSizeMake(textSize.width, ceilf(textSize.height));
        dispatch_async(dispatch_get_main_queue(), ^{
            calculateBlock(vaildSize,lineCount);
        });
    });
}

+(void)pp_calculateYYLabelWithContainerSize:(CGSize)containerSize
                                lineSpacing:(CGFloat)lineSpace
                                 vaildLines:(NSUInteger)vaildLines
                                       text:(id)text
                             calculateBlock:(calculateBlock)calculateBlock
{
    NSMutableAttributedString *attributedStr = [NSMutableAttributedString pp_attributedStringHandleWithIdText:text];
    if (!attributedStr) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
        YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
 
        CGSize textSize = textLayout.textBoundingSize;
        NSUInteger lineCount = textLayout.rowCount;
 
        CGSize needSize = CGSizeMake(textSize.width, ceilf(textSize.height));

        if (vaildLines != 0  && vaildLines <= lineCount) {  //0代表没有限制
            CGFloat lineSpaceCount = lineCount-1;  //所有的行间距综合
            CGFloat totalLineSpaceHeight = lineSpaceCount*lineSpace; //行间距总高
            CGFloat oneLineHeight = (textSize.height-totalLineSpaceHeight)/lineCount;  //每行文字的高度
            CGFloat needHeigh = (vaildLines-1)*lineSpace+oneLineHeight*vaildLines;
            if (vaildLines%2 == 0) {
                needHeigh+=00002;
            }
            NSLog(@"oneLineHeight-%f-needHeigh-%f--ceilf(oneLineHeight) %f",oneLineHeight,needHeigh,ceilf(oneLineHeight));
            needSize = CGSizeMake(textSize.width, needHeigh);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            calculateBlock(needSize,lineCount);
        });
    });
}

+(CGSize)pp_calculateYYLabelWithContainerSize:(CGSize)containerSize font:(id)font text:(NSString *)text
{
    NSAssert((text && text.length > 0), @"%s PP警告：你传入的字符串不是nil就是@"",哪有宽度，我不计算，白浪费我时间~.~",__func__);
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:text];
    [UIFont pp_fontWithIdFont:font forAttributedStr:attributedStr];
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:containerSize];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:textContainer text:attributedStr];
    CGSize calculateSize = textLayout.textBoundingSize;
    CGSize textSize = CGSizeMake(calculateSize.width, ceilf(calculateSize.height));
    
    return textSize;
}
@end
