//
//  PPCustomTextField.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCustomTextField.h"

@interface PPCustomTextField ()
/** 占位符高度 */
@property(nonatomic,assign)CGFloat placeholderHeight;
/** 文字高 */
@property(nonatomic,assign)CGFloat textHeight;

@end

@implementation PPCustomTextField


- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGFloat x = CGRectGetMinX(bounds);
    CGFloat width = CGRectGetWidth(bounds);
    CGFloat height = CGRectGetHeight(bounds);
    
    UIFont *textFont;
    if (self.placeholder.length > 0) {
        textFont = self.font;
    }
    
    //说明：有attributedPlaceholder后，placeholder就废了
    __block NSString *fontNameStr = @"";
    __block CGFloat fontSize = 0;
    if (self.attributedPlaceholder.length > 0) {
        if (self.placeholderHeight <= 0) {  //没有计算过它的高度
            [self.attributedPlaceholder enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, self.attributedPlaceholder.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
                UIFont *font = (UIFont *)value;
                NSString *tempFontNameStr = font.fontDescriptor.postscriptName;
                CGFloat tempFontSize = font.fontDescriptor.pointSize;
                if (tempFontSize >= fontSize) {
                    fontSize = tempFontSize;
                    fontNameStr = tempFontNameStr;
                }
            }];
            
#warning pp605 此处怎么获取当前的字体名，这样再设置是最严谨的
#warning pp605 此处怎么获取当前的字体名，这样再设置是最严谨的
#warning pp605 此处怎么获取当前的字体名，这样再设置是最严谨的
            //粗体
            if ([fontNameStr isEqualToString:@".SFUIDisplay-Semibold"]) {
                textFont = [UIFont boldSystemFontOfSize:fontSize];
            }
            //默认
            else{
                textFont = [UIFont systemFontOfSize:fontSize];
            }
            
        }
    }
    
    if (self.textHeight <= 0) {
        self.textHeight = [self getHeightWithFont:self.font];
    }
  
    if (self.placeholderHeight <= 0) {
        self.placeholderHeight = [self getHeightWithFont:textFont];
    }
    
    CGFloat placeholderY = 0;
    if (self.textHeight-self.placeholderHeight > 0) {
        placeholderY = (self.textHeight-self.placeholderHeight)/2;
    }
    NSLog(@"高度分别是 %f---%f---%f",self.textHeight,self.placeholderHeight,self.textHeight-self.placeholderHeight);

    return CGRectMake(x, placeholderY, width, height);
    
    

}

-(CGFloat)getHeightWithFont:(UIFont *)font
{
    NSString *strq = @"";
    CGSize size = [strq boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.height;
}


@end
