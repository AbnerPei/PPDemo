//
//  UIControl+PPEvent.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIControl+PPEvent.h"
#import <objc/runtime.h>
#import "NSObject+Runtime.h"


@implementation UIControl (PPEvent)
+(void)load
{
    [NSObject pp_runtime_exchangeWithClass:self originalSelector:@selector(sendAction:to:forEvent:) swizzledSelector:@selector(pp_sendAction:to:forEvent:)];
}

-(void)pp_sendAction:(SEL)action to:(id)target forEvent:(UIControlEvents)event
{
    if (self.pp_eventIgnore) {
        return;
    }
    
    if (self.pp_eventTimeInterval > 0) {
        self.pp_eventIgnore = YES;
        [self performSelector:@selector(setPp_eventIgnore:) withObject:@(NO) afterDelay:self.pp_eventTimeInterval];
    }
    
    [self pp_sendAction:action to:target forEvent:event];
}

-(NSTimeInterval)pp_eventTimeInterval
{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
-(void)setPp_eventTimeInterval:(NSTimeInterval)pp_eventTimeInterval
{
    return objc_setAssociatedObject(self, @selector(pp_eventTimeInterval), @(pp_eventTimeInterval), OBJC_ASSOCIATION_RETAIN);
}

-(BOOL)pp_eventIgnore
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(void)setPp_eventIgnore:(BOOL)pp_eventIgnore
{
    return objc_setAssociatedObject(self, @selector(pp_eventIgnore), @(pp_eventIgnore), OBJC_ASSOCIATION_RETAIN);
}

@end
