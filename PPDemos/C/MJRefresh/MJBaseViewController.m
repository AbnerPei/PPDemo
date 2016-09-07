//
//  MJBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJBaseViewController.h"

@interface MJBaseViewController ()

@end

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
//                     @"至少两个view相互约束",
//                     @"长按图片保存到本地",
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"MJDefaultViewController",
                  @"MJDefaultBlockViewController",
                  @"MJAnimationImageViewController",
                  @"MJCustomRefreshViewController",
//                  @"TwoMoreViewController",
//                  @"LongPressToSaveViewController",
                  ] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
