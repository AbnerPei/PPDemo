//
//  PPTransitionsViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPTransitionsViewController.h"

@interface PPTransitionsViewController ()

@end

@implementation PPTransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles = [@[
                     @"UIPresentationController学习",
                     @"UIPresentationController弹窗实现"
                     ] mutableCopy];
    self.vcs = [@[
                  @"UIPresentationDemoViewController",
                  @"UIPresentationDemoViewController2"
                  ] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
[UIPresentationController简介]http://blog.csdn.net/ideaspress/article/details/51177934
*/

@end
