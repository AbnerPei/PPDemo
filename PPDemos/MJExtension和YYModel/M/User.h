//
//  User.h
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  http://www.jianfeice.com/201604/3722.html

#import <Foundation/Foundation.h>
#import "Student.h"
typedef enum {
    SexMale,
    SexFemale
} Sex;



@interface User : NSObject<NSCoding>

@property (copy, nonatomic) NSString *name;/* 姓名 */
@property (copy, nonatomic) NSString *icon;/* 头像 */
@property (assign, nonatomic) unsigned int age;/* 年龄 */
@property (copy, nonatomic) NSString *height;/* 身高 */
@property (strong, nonatomic) NSNumber *money;/* 资产 */
@property (assign, nonatomic) Sex sex;/* 性别 */
@property (assign, nonatomic, getter=isGay) BOOL gay;/* 是否是同性恋 */


//以下方法是为了runtime示例创建
-(void)user_eat;
-(void)user_say;
-(void)user_sleep;

+(void)pp_read;
+(void)pp_jump;

@end
