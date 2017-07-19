//
//  PPButton.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPButton : UIButton

/** 文字颜色（nomal状态下）  */
@property(nonatomic,strong)UIColor *titleColor;
/** bgColor nomal状态下 */
@property(nonatomic,strong)UIColor *bgColor;
/** 不可点击时背景色 (商品售完、活动结束等) */
@property(nonatomic,strong)UIColor *disenabledBgColor;
/** 高亮时alpha, 默认0.8*/
@property(nonatomic,assign)CGFloat highlightedAlpha;
/** 不可点击时透明度 */
@property(nonatomic,assign)CGFloat disenabledAlpha;
/////转移layer的属性
@property(nonatomic,assign)CGFloat cornerRadius;
@property(nonatomic,strong)UIColor *borderColor;
@property(nonatomic,assign)CGFloat borderWidth;

@end
