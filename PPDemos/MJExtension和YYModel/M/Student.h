//
//  Student.h
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol StudentTestDelegate <NSObject>

-(void)justForTest;

@end

@class Bag;

@interface Student : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;

@property (assign, nonatomic) id<StudentTestDelegate> delegate;/* 测试用的协议 */

@end
