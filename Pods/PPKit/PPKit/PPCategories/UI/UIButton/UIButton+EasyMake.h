//
//  UIButton+EasyMake.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
typedef void(^PPBTActionBlock)(void);

#import <UIKit/UIKit.h>

@interface UIButton (EasyMake)
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV;

///
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                             title:(NSString *)title;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                     titleFontSize:(CGFloat)titleFontSize
                             title:(NSString *)title;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                 titleBoldFontSize:(CGFloat)titleBoldFontSize
                             title:(NSString *)title;

////含有cornerRadius
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                             title:(NSString *)title;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                     titleFontSize:(CGFloat)titleFontSize
                             title:(NSString *)title;
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                      cornerRadius:(CGFloat)cornerRadius
                           bgColor:(UIColor *)bgColor
                        titleColor:(UIColor *)titleColor
                 titleBoldFontSize:(CGFloat)titleBoldFontSize
                             title:(NSString *)title;

//图片
+(instancetype)pp_btMakeWithSuperV:(UIView *)superV
                         imageName:(NSString *)imageName;

@end


@interface UIButton (BlockAction)
-(void)pp_btWithActionBlock:(PPBTActionBlock)actionBlock
               controlEvent:(UIControlEvents)controlEvents;
-(void)pp_btWithActionBlock:(PPBTActionBlock)actionBlock;
@end
