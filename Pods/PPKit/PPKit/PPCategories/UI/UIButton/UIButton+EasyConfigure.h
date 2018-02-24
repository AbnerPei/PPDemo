//
//  UIButton+EasyConfigure.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/9/7.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EasyConfigure)

/**
 设置btn正常时的bgColor、title
 */
-(void)pp_btWithBgColor:(UIColor *)bgColor
                         title:(NSString *)title;
/**
 设置btn可点击时的bgColor、title 【配置了userInteractionEnabled = YES】
 */
-(void)pp_btWithEnabledBgColor:(UIColor *)bgColor
                         title:(NSString *)title;
/**
 设置btn【不】可点击时的bgColor、title 【配置了userInteractionEnabled = NO】
 */
-(void)pp_btWithUnenabledBgColor:(UIColor *)bgColor
                           title:(NSString *)title;


/**
 设置btn Normal和Highlighted下的image 【相同】
 */
-(void)pp_btSetImageWithImgName:(NSString *)imgName;
/**
 设置btn Normal和Highlighted下的TitleColor 【相同】
 */
-(void)pp_btSetTitleColor:(UIColor *)titleColor;
/**
 设置btn Normal和Highlighted下的Title 【相同】
 */
-(void)pp_btSetTitle:(NSString *)title;
@end
