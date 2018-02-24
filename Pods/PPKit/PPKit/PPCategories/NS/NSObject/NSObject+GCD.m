//
//  NSObject+GCD.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSObject+GCD.h"

@implementation NSObject (GCD)
+(void)pp_gcdAsync:(NSObjectGCDBlock)asyncBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), asyncBlock);
}

+(void)pp_gcdAsync:(NSObjectGCDBlock)asyncBlock toMain:(NSObjectGCDBlock)mainBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        asyncBlock();
        dispatch_async(dispatch_get_main_queue(), mainBlock);
    });
}

+(void)pp_gcdAfter:(NSObjectGCDBlock)afterMainBlock delay:(NSUInteger)delay
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), afterMainBlock);
}
@end
