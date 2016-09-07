//
//  Person.h
//  PPDemos
//
//  Created by Abner on 16/6/24.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

//JSExport对象的用法(导入头文件)
//1: 首先自定义个协议继承自JSExprot，并定义需要暴露给js的属性和方法
@protocol JSPersonProtocol <JSExport>

//@property (nonatomic, copy) NSDictionary *data;
- (NSString *)whatYouName;

@end

//2: 新建一个native对象(Person)，实现协议和方法
@interface Person : NSObject<JSPersonProtocol>
@property (nonatomic, copy)NSString *name;
- (NSString *)whatYouName;
@end
