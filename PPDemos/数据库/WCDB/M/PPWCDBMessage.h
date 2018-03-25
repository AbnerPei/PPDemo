//
//  PPWCDBMessage.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/12.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PPWCDBMessage : NSObject
@property(nonatomic,assign) int localID;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,strong) NSDate *creatTime;
@property(nonatomic,strong) NSDate *modifiedTime;
@property(nonatomic,assign) int unused;
@end



