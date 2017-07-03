//
//  UIButton+MakeBT.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
typedef void(^btActionBlock)();

#import <UIKit/UIKit.h>

@interface UIButton (MakeBT)

+(instancetype)pp_btMakeWithSuperV:(UIView *)superV;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                            action:(SEL)action
                            target:(id)target;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                       actionBlock:(btActionBlock)actionBlock;
@end


@interface UIButton (MakeBTSystem)
-(void)pp_btWithTitleColor:(UIColor *)titleColor
                     title:(NSString *)title;

-(void)pp_btWithIsGray:(BOOL)isGray
               bgColor:(UIColor *)bgColor
            titleColor:(UIColor *)titleColor
                 title:(NSString *)title;
@end




@interface UIButton (BlockAction)
-(void)pp_actionWithControlEvent:(UIControlEvents )event
                       withBlock:(btActionBlock)block;
@end
