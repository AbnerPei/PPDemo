//
//  User.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "User.h"

@interface User ()<StudentTestDelegate>

@end

@implementation User

-(void)user_eat
{
    NSLog(@"runtime-eat-->人如果吃不好,就不能好好思考,好好爱,好好休息。");
}
-(void)user_say
{
    NSLog(@"runtime-say-->发自内心的话，就能深入人心。");
}
-(void)user_sleep
{
    NSLog(@"runtime-sleep-->中午不睡，下午作废。");
}

#pragma mark --- NSCoding协议
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

-(void)justForTest
{
    NSLog(@"runtime-justForTest-->User对象遵守Student类的协议");
}

+(void)pp_read
{
    NSLog(@"runtime-pp_read-->我在读古典的书《拆掉思维里的墙：原来我还可以这样活》");
}
+(void)pp_jump
{
    NSLog(@"runtime-pp_jump-->去跳舞《抓钱舞》");
}
@end
