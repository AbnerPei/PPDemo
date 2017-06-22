//
//  UIButton+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^handleAction)();

@interface UIButton (PPSets)

@end


@interface UIButton (PPAction)
/**
 *  【1】封装Button的点击事件（ addTarget:** action:** forControlEvents:** ）.
 *
 *  @param event UIControlEvents之一
 *  @param block 添加点击事件的block
 */
-(void)pp_handleEvent:(UIControlEvents )event withBlock:(handleAction)block;

@end

@interface UIButton (Timer)
/*!
 *  @author ╰莪呮想好好宠Nǐつ, 15-12-11 10:12:22
 *
 *  简单倒计时器
 *
 *  @param timeout    时间间隔
 *  @param tittle     最终要显示的内容
 *  @param waitTittle 倒计时时显示的内容
 */
-(void)pp_startTime:(NSInteger )timeout tittle:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end