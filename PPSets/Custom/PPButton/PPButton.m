//
//  PPButton.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPButton.h"

@implementation PPButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self updateButtonConfiguration];
    }
    return self;
}


/**
 更新button的配置，每设置一个属性，都需要调用一次
 */
-(void)updateButtonConfiguration
{
    [self setTitleColor:_titleColor forState:UIControlStateNormal];
    self.backgroundColor = self.enabled ? _bgColor:_disenabledBgColor;
    [self updateAlpha:!self.enabled xxAlpha:_disenabledAlpha];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = _borderWidth;

}

#pragma mark --- 设置默认数据
-(void)setupDefaultConfiguration
{
    if (!_titleColor) { _titleColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1.0]; }
    if (!_bgColor) { _bgColor = [UIColor clearColor]; }
    if (!_disenabledBgColor) { _disenabledBgColor = [UIColor lightGrayColor]; }
    if (!_highlightedAlpha) { _highlightedAlpha = 0.7; }
    if (!_disenabledAlpha) { _disenabledAlpha = 0.6; }
    
    if (!_cornerRadius) { _cornerRadius = 0; }
    if (!_borderColor) { _borderColor = [UIColor clearColor]; }
    if (!_borderWidth) { _borderWidth = 0; }
   
}
-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self updateAlpha:highlighted xxAlpha:_highlightedAlpha];
}
-(void)updateAlpha:(BOOL)hasAlpha xxAlpha:(CGFloat)xxAlpha
{
    self.alpha = hasAlpha ? xxAlpha:1.0;
}

//=========-------重写对应属性的set方法-------=========\\

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    [self updateButtonConfiguration];
}
-(void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self updateButtonConfiguration];
}
-(void)setDisenabledBgColor:(UIColor *)disenabledBgColor
{
    _disenabledBgColor = disenabledBgColor;
    [self updateButtonConfiguration];
}

-(void)setHighlightedAlpha:(CGFloat)highlightedAlpha
{
    _highlightedAlpha = highlightedAlpha;
    [self updateButtonConfiguration];
}
-(void)setDisenabledAlpha:(CGFloat)disenabledAlpha
{
    _disenabledAlpha = disenabledAlpha;
    [self updateButtonConfiguration];
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = fabs(cornerRadius);
    [self updateButtonConfiguration];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self updateButtonConfiguration];
}
-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = fabs(borderWidth);
    [self updateButtonConfiguration];
}


@end
