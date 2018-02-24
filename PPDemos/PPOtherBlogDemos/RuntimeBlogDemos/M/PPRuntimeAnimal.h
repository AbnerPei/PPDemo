//
//  PPRuntimeAnimal.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPRuntimeAnimal : NSObject
/** 年龄 */
@property(nonatomic,strong) NSNumber *age;
/** 性别 */
@property(nonatomic,assign) BOOL isMale;
/** 出生日期 */
@property(nonatomic,copy) NSString *birthday;
@end
