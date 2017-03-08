//
//  MJBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJBaseViewController.h"

@implementation MJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MJRefreshDemos";
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
