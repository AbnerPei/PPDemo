//
//  MJExtensionBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJExtensionBaseViewController.h"

@interface MJExtensionBaseViewController ()

@end

@implementation MJExtensionBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MJExtensionDemos";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"MJExtension 格式转换"
//                     @"下拉刷洗和上拉加载（默认但用block方法）",
//                     @"动画图片",
//                     @"自定义刷新控件",
                     //                     @"至少两个view相互约束",
                     //                     @"长按图片保存到本地",
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"MJExtensionViewController"
//                  @"MJDefaultBlockViewController",
//                  @"MJAnimationImageViewController",
//                  @"MJCustomRefreshViewController",
                  //                  @"TwoMoreViewController",
                  //                  @"LongPressToSaveViewController",
                  ] mutableCopy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
