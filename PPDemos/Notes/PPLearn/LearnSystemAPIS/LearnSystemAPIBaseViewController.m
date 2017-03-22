//
//  LearnSystemAPIBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "LearnSystemAPIBaseViewController.h"

@interface LearnSystemAPIBaseViewController ()

@end

@implementation LearnSystemAPIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"夯实iOS基本功";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"下拉刷洗和上拉加载（默认）",
                     @"下拉刷洗和上拉加载（默认但用block方法）",
                     @"动画图片",
                     @"自定义刷新控件",
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"MJDefaultViewController",
                  @"MJDefaultBlockViewController",
                  @"MJAnimationImageViewController",
                  @"MJCustomRefreshViewController",
                  ] mutableCopy];
}

@end
