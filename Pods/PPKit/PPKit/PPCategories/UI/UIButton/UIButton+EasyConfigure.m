//
//  UIButton+EasyConfigure.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/9/7.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "UIButton+EasyConfigure.h"

@implementation UIButton (EasyConfigure)

-(void)pp_btWithBgColor:(UIColor *)bgColor title:(NSString *)title
{
    if (bgColor) {
        self.backgroundColor = bgColor;
    }
    if (title && title.length > 0) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
    }
}
-(void)pp_btWithEnabledBgColor:(UIColor *)bgColor title:(NSString *)title
{
    self.userInteractionEnabled = YES;
    [self pp_btWithBgColor:bgColor title:title];
}

-(void)pp_btWithUnenabledBgColor:(UIColor *)bgColor title:(NSString *)title
{
    self.userInteractionEnabled = NO;
    [self pp_btWithBgColor:bgColor title:title];

}

#pragma mark --- 设置btn Normal和Highlighted下的image 【相同】
-(void)pp_btSetImageWithImgName:(NSString *)imgName
{
    if (imgName.length == 0 ) {
        return;
    }
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateHighlighted];
}

#pragma mark --- 设置btn Normal和Highlighted下的titleColor 【相同】
-(void)pp_btSetTitleColor:(UIColor *)titleColor
{
    if (!titleColor) {
        return;
    }
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateHighlighted];
}

#pragma mark --- 设置btn Normal和Highlighted下的title 【相同】
-(void)pp_btSetTitle:(NSString *)title
{
    if (!title || title.length == 0) {
        return;
    }
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
}
@end
