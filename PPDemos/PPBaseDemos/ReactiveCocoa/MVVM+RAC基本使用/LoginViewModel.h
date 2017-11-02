//
//  LoginViewModel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
@interface LoginViewModel : NSObject

/** 登录命令  */
@property(nonatomic,strong)RACCommand *loginCommand;
/** 登录按钮是否可点信号  */
@property(nonatomic,strong)RACSignal *loginBTEnableSignal;
/** 姓名 */
@property (nonatomic,copy) NSString *name;
/** 密码 */
@property (nonatomic,copy) NSString *password;
@end
