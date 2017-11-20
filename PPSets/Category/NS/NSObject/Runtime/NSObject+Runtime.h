//
//  NSObject+Runtime.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)
/** 交换方法 */
+(void)pp_runtime_exchangeWithClass:(Class)cls
                   originalSelector:(SEL)originalSelector
                   swizzledSelector:(SEL)swizzledSelector;

@end
