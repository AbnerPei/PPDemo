//
//  UIControl+PPEvent.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 控制（主要是btn）点击时间间隔、是否可点
 */
@interface UIControl (PPEvent)
/** 响应点击事件的间隔 */
@property(nonatomic,assign) NSTimeInterval pp_eventTimeInterval;
/** 是否可点 */
@property(nonatomic,assign) BOOL pp_eventIgnore;
@end
