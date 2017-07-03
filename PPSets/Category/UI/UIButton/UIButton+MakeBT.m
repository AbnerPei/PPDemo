//
//  UIButton+MakeBT.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIButton+MakeBT.h"
#import <objc/runtime.h>
static char btnKey;

@implementation UIButton (MakeBT)
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
{
    UIButton *bt = [self buttonWithType:UIButtonTypeCustom];
    return bt;
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                            action:(SEL)action
                            target:(id)target
{
    UIButton *bt = [self pp_btMakeWithSuperV:superV];
    [bt addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return bt;
}
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                       actionBlock:(btActionBlock)actionBlock
{
    UIButton *bt = [self pp_btMakeWithSuperV:superV];
    [bt pp_actionWithControlEvent:UIControlEventTouchUpInside withBlock:^{
        if (actionBlock) {
            actionBlock();
        }
    }];
    return bt;
}
@end


@implementation UIButton (MakeBTSystem)
-(void)pp_btWithTitleColor:(UIColor *)titleColor
                     title:(NSString *)title
{
    
}

-(void)pp_btWithIsGray:(BOOL)isGray
               bgColor:(UIColor *)bgColor
            titleColor:(UIColor *)titleColor
                 title:(NSString *)title
{
    self.userInteractionEnabled = isGray;
    if (bgColor) {
        self.backgroundColor = bgColor;
    }
    if (title) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
    }
    if (titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateHighlighted];
    }
}

@end



@implementation UIButton (BlockAction)
-(void)pp_actionWithControlEvent:(UIControlEvents)event
                       withBlock:(btActionBlock)block
{
    objc_setAssociatedObject(self, &btnKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clickAction:(UIButton *)button{
    btActionBlock block =objc_getAssociatedObject(self, &btnKey);
    if (block) {
        block();
    }
}

@end
