//
//  NSObject+PPName.m
//  PPDemos
//
//  Created by Abner on 16/8/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "NSObject+PPName.h"

@implementation NSObject (PPName)
char nameKey;

-(void)setPp_name:(NSString *)pp_name
{
     // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, &nameKey, pp_name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)pp_name
{
    return objc_getAssociatedObject(self, &nameKey);
}

@end
