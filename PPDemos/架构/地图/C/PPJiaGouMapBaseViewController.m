//
//  PPJiaGouMapBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPJiaGouMapBaseViewController.h"

@interface PPJiaGouMapBaseViewController ()

@end

@implementation PPJiaGouMapBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"架构之地图";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"高德地图/百度地图",
                     @"高德地图",
                     @"百度地图"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPJiaGouCommonMapViewController",
                  @"PPJiaGouGaodeMapViewController",
                  @"PPJiaGouBaiduMapViewController",
                  ] mutableCopy];
}

@end
