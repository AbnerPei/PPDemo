//
//  UIApplication+PPSets.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/9/11.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "UIApplication+PPSets.h"
#import <libkern/OSAtomic.h> //第一个用到

@implementation UIApplication (PPSets)

@end

@implementation UIApplication (NetworkActivity)

static volatile int32_t numberOfActiveNetworkConnections;

- (void)pp_beganNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnections) > 0;
}

- (void)pp_endedNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnections) > 0;
}

@end