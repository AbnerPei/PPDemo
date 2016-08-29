//
//  FunctionalViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "FunctionalViewController.h"

@interface FunctionalViewController ()

@end

@implementation FunctionalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"一些功能性的demos";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"生成二维码",
//                     @"下拉刷洗和上拉加载（默认但用block方法）",
//                     @"动画图片",
//                     @"自定义刷新控件",
                     //                     @"至少两个view相互约束",
                     //                     @"长按图片保存到本地",
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"CreatQRCodeViewController",
//                  @"MJDefaultBlockViewController",
//                  @"MJAnimationImageViewController",
//                  @"MJCustomRefreshViewController",
                  //                  @"TwoMoreViewController",
                  //                  @"LongPressToSaveViewController",
                  ] mutableCopy];
}

@end
