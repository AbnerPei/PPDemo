//
//  PPVerificationCodeView.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/5.
//  Copyright © 2017年 PPAbner. All rights reserved.
//  感谢 https://github.com/meiqi1992/MQVerCodeView

/*
   三种方式获取当前的验证码
   1. 代理
   2. 属性
   3. block
 
 */

@protocol PPVerificationCodeViewDelegate <NSObject>

-(void)pp_verificationCodeView:(UIView *)verificationCodeView verificationCodeStr:(NSString *)verificationCode;

@end

#import <UIKit/UIKit.h>

typedef void(^PPVerificationCodeBlock)(NSString *verificationCode);

@interface PPVerificationCodeView : UIView
/** 验证码  */
@property(nonatomic,copy,readonly)NSString *verificationCode;
/** 验证码代理 */
@property(nonatomic,assign)id<PPVerificationCodeViewDelegate> delegate;
/** 验证码block  */
@property(nonatomic,copy)PPVerificationCodeBlock verificationCodeBlock;

/**
 验证码view初始化
 @param frame frame
 @param hasRoated 是否偏转一点
 */
-(instancetype)initWithFrame:(CGRect)frame hasRoated:(BOOL)hasRoated;
+(instancetype)pp_withFrame:(CGRect)frame hasRoated:(BOOL)hasRoated;

-(void)refreshVerificationCode;  //第一次用(block和代理用，放在.m的init方法里，前两者就第一次无效)，点击事件也走，但已在.m内部完成

@end
