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