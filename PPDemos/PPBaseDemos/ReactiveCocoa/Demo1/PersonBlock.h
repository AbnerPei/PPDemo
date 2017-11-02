//
//  PersonBlock.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/7.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonBlock : NSObject
-(PersonBlock *(^)(int))run;
@end
