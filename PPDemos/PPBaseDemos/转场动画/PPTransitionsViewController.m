//
//  PPTransitionsViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
/* 
 //参考：
 [UIPresentationController简介]http://blog.csdn.net/ideaspress/article/details/51177934
 */
#import "PPTransitionsViewController.h"

@interface PPTransitionsViewController ()

@end

@implementation PPTransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles = [@[
                     @"UIPresentationController（继承自NSObject）使用",
                     @"自定义push/pop转场"
                     ] mutableCopy];
    self.vcs = [@[
                  @"PPUIPresentationControllerBaseDemoViewController",
                  @"PPPushPopFirstViewController"
                  ] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
