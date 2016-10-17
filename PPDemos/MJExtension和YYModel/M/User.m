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

+(NSArray *)mj_ignoredPropertyNames
{
    NSLog(@"走了不不管");
    return @[@"name",@"icon"];
}
//----------------- 类方法-----------
+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    NSLog(@"%s---%@",__func__,propertyName);
    if ([propertyName isEqualToString:@"name"]) {
        return @"ppname";
    }
    return propertyName;
}

/**
*  旧值换新值，用于过滤字典中的值(例如返回的是nil,设置为默认的“30”)
*  @param oldValue 旧值（相当于下例子的nil）
*  @param property 包装的属性MJProperty的一个对象
*  @return 新值
*/
//- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
//{
//    if ([property.name isEqualToString:@"name"]) {
//        if (oldValue == nil) {
//            oldValue = @"30";
//        }
//    }
//    return oldValue;
//
//}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"id":@"shopID",
             };
}
+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{
              @"name": @[@"ppname", @"pppname", @"abcname",@"name"]
             };
}

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
