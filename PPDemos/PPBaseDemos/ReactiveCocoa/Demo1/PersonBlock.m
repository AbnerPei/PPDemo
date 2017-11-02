//
//  PersonBlock.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/7.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PersonBlock.h"

@implementation PersonBlock
-(PersonBlock *(^)(int))run
{
    //函数参数是个返回PersonBlock *(^)(int)的block
    return ^PersonBlock *(int m){
        //而block又是有返回PersonBlock *对象的
        NSLog(@"这个人跑了%d米",m);
        return self;
    };
}
@end
