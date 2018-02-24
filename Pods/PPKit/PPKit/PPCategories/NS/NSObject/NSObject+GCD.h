//
//  NSObject+GCD.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NSObjectGCDBlock)(void);

@interface NSObject (GCD)
+(void)pp_gcdAsync:(NSObjectGCDBlock)asyncBlock;

+(void)pp_gcdAsync:(NSObjectGCDBlock)asyncBlock
            toMain:(NSObjectGCDBlock)mainBlock;

+(void)pp_gcdAfter:(NSObjectGCDBlock)afterMainBlock
             delay:(NSUInteger)delay;

@end
