//
//  UIImageView+CornerRadius.h
//  MyPractise
//
//  Created by lzy on 16/3/1.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImageView (CornerRadius)


- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)zy_cornerRadiusRoundingRect;

- (void)zy_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

//【作者库链接】https://github.com/liuzhiyi1992/ZYCornerRadius

//声明：为了便于自己统一pp_前缀调用，重写上面的方法为自己习惯的命名，方便自己调用！感谢作者开源！


/** 创建一个imgV  圆角弧度 圆角位置 */
-(instancetype)pp_imgVMakeWithCornerRadius:(CGFloat)cornerRadius
                           rectCornerType:(UIRectCorner)rectCornerType;
/** 创建一个圆形imgV */
-(instancetype)pp_imgVMakeRounded;

/** imgV设置  圆角弧度 圆角位置 */
-(void)pp_imgVCornerRadius:(CGFloat)cornerRadius
            rectCornerType:(UIRectCorner)rectCornerType;

/** imgV设置为圆形 */
-(void)pp_imgVRounded;

/** imgV设置边框  边框宽度 边框颜色 */
-(void)pp_imgVBorderWidth:(CGFloat)BorderWidth
              borderColor:(UIColor *)borderColor;



@end
