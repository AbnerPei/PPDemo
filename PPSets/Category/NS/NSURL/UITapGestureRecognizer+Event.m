//
//  UITapGestureRecognizer+Event.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UITapGestureRecognizer+Event.h"
#import <objc/runtime.h>
@implementation UITapGestureRecognizer (Event)
+(void)load
{
    Method initGestureRecognizerMethod = class_getInstanceMethod([UITapGestureRecognizer class], @selector(initWithTarget:action:));
    Method ppInitGestureRecognizerMethod = class_getInstanceMethod([UITapGestureRecognizer class], @selector(pp_initWithTarget:action:));
    method_exchangeImplementations(initGestureRecognizerMethod, ppInitGestureRecognizerMethod);
}

-(instancetype)pp_initWithTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]pp_initWithTarget:target action:action];
    NSLog(@"%@---%@",NSStringFromClass(gestureRecognizer.class),target);
    return gestureRecognizer;
}
@end
