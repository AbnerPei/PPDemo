//
//  NSObject+PPName.h
//  PPDemos
//
//  Created by Abner on 16/8/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
//创建一个分类，比如给任何一个对象都添加一个pp_name属性，就是NSObject添加分类（NSObject+Category）

@interface NSObject (PPName)

@property(nonatomic,copy)NSString *pp_name;

@end
