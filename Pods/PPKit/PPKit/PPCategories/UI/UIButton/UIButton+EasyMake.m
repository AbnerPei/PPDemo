//
//  UIButton+EasyMake.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIButton+EasyMake.h"
#import <objc/runtime.h>

@implementation UIButton (EasyMake)
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
{
    UIButton *bt = [self buttonWithType:UIButtonTypeCustom];
    if (superV) {
        [superV addSubview:bt];
    }
    return bt;
}
///
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                             title:(NSString *)title
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    if (superV) {
        [superV addSubview:bt];
    }
    if (bgColor) {
        bt.backgroundColor = bgColor;
    }
    if (titleColor) {
        [bt setTitleColor:titleColor forState:UIControlStateNormal];
        [bt setTitleColor:titleColor forState:UIControlStateHighlighted];
    }
    if (title && title.length > 0) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitle:title forState:UIControlStateHighlighted];
    }
    
    return bt;
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                     titleFontSize:(CGFloat)titleFontSize
                             title:(NSString *)title
{
    UIButton *bt = [UIButton pp_btMakeWithSuperV:superV bgColor:bgColor titleColor:titleColor title:title];
    if (titleFontSize > 0) {
        bt.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    }
    return bt;
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                 titleBoldFontSize:(CGFloat)titleBoldFontSize
                             title:(NSString *)title
{
    UIButton *bt = [UIButton pp_btMakeWithSuperV:superV bgColor:bgColor titleColor:titleColor title:title];
    if (titleBoldFontSize > 0) {
        bt.titleLabel.font = [UIFont boldSystemFontOfSize:titleBoldFontSize];
    }
    return bt;
}

////含有cornerRadius
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                             title:(NSString *)title
{
    UIButton *bt = [UIButton pp_btMakeWithSuperV:superV bgColor:bgColor titleColor:titleColor title:title];
    if (cornerRadius > 0) {
        bt.layer.masksToBounds = YES;
        bt.layer.cornerRadius = cornerRadius;
    }
    return bt;
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                     titleFontSize:(CGFloat)titleFontSize
                             title:(NSString *)title
{
    UIButton *bt = [UIButton pp_btMakeWithSuperV:superV cornerRadius:cornerRadius bgColor:bgColor titleColor:titleColor title:title];
    if (titleFontSize > 0) {
        bt.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    }
    return bt;
    
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                 titleBoldFontSize:(CGFloat)titleBoldFontSize
                             title:(NSString *)title
{
    UIButton *bt = [UIButton pp_btMakeWithSuperV:superV cornerRadius:cornerRadius bgColor:bgColor titleColor:titleColor title:title];
    if (titleBoldFontSize > 0) {
        bt.titleLabel.font = [UIFont boldSystemFontOfSize:titleBoldFontSize];
    }
    return bt;
}

+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                         imageName:(NSString *)imageName
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    if (superV) {
        [superV addSubview:bt];
    }
    if (imageName && imageName.length > 0) {
        [bt setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [bt setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
    return bt;
}

@end


@implementation UIButton(BlockAction)

-(void)pp_btWithActionBlock:(PPBTActionBlock)actionBlock controlEvent:(UIControlEvents)controlEvents
{
    objc_setAssociatedObject(self, @selector(pp_btAction), actionBlock, OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(pp_btAction) forControlEvents:controlEvents];
}
-(void)pp_btAction
{
    PPBTActionBlock actionBlock = objc_getAssociatedObject(self, _cmd);
    if (actionBlock) {
        actionBlock();
    }
}

-(void)pp_btWithActionBlock:(PPBTActionBlock)actionBlock
{
    return [self pp_btWithActionBlock:actionBlock controlEvent:UIControlEventTouchUpInside];
}
@end
