//
//  LoginViewModel.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    _loginBTEnableSignal = [RACSignal combineLatest:@[RACObserve(self, name),RACObserve(self, password)] reduce:^id(NSString *name,NSString *password){
        return @(name.length && password.length);
    }];
    
    
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        //发送网络请求
        NSLog(@"发送了网络请求");
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"请求到网络数据了饿"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    //获取命令中信号源
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"获取命令中信号源 --- %@",x);
    }];
    
}
@end
