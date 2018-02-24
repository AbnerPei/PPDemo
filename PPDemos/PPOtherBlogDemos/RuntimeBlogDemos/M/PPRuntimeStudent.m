//
//  PPRuntimeStudent.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPRuntimeStudent.h"

@interface PPRuntimeStudent ()
{
    BOOL hasFriend;
    BOOL _isGood3;
}
/** 自我介绍 */
@property(nonatomic,copy) NSString *selfIntroduce;
@end

@implementation PPRuntimeStudent
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.selfIntroduce = @"哈喽，大家好，我叫PPAbner,我来自召唤师峡谷。";
        hasFriend = NO;  //天天玩游戏，哪有时间谈恋爱。
    }
    return self;
}
@end
