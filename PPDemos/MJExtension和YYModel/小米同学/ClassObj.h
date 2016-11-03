//
//  ClassObj.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/11/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassObj : NSObject

@property (nonatomic,copy) NSString *beginTime;
@property (nonatomic,copy) NSString *classRoom;
@property (nonatomic,copy) NSString *courseId;
@property (nonatomic,strong) NSArray *courseLabel;
@property (nonatomic,copy) NSString *detailId;
@property (nonatomic,copy) NSString *endTime;
@property (nonatomic,copy) NSString *teacherName;

@end

