//
//  PPRuntimePerson.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPRuntimeAnimal.h"

@interface PPRuntimePerson : PPRuntimeAnimal
/** 国家 */
@property(nonatomic,strong) NSString *country;
/** 财富 */
@property(nonatomic,assign) CGFloat money;
/** 名字 */
@property(nonatomic,copy) NSString *name;
@end
