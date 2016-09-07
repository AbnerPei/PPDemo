//
//  Status.h
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@class Status;

@interface Status : NSObject
@property (copy, nonatomic) NSString *text;
@property (strong, nonatomic) User *user;/* 其他模型类型 */
@property (strong, nonatomic) Status *retweetedStatus;/* 自我模型类型 */
@end
