//
//  UIView+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PPSets)

@end


@interface UIView (PPFrame)

@end



@interface UIView (PPDashedLine)

/*  绘制虚线
 ** lineFrame:     虚线的 frame
 ** length:        虚线中短线的宽度
 ** spacing:       虚线中短线之间的间距
 ** color:         虚线中短线的颜色
 */
+ (UIView *)pp_createDashedLineWithFrame:(CGRect)lineFrame lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color;
@end


@interface UIView (BlurEffect)

/**创建一张实时模糊效果 View (毛玻璃效果)*/
#warning Avilable in iOS 8.0 and later
+ (UIVisualEffectView *)pp_effectViewWithFrame:(CGRect)frame;

@end