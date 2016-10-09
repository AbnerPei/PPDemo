//
//  PPHomeViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPHomeViewController.h"
#import "PPLabel.h"
@interface PPHomeViewController ()

@end

@implementation PPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                 @"MJRefrsh使用Demos",
                 @"MJExtension使用Demos",
                 @"Masonry使用Demos",
                 @"label垂直位置（居上，居中，居下）",
                 @"JavaScriptCore使用",
                 @"Animation Demos",
                 @"Runtime学习",
                 @"YYText使用demos",
                 @"算法学习集合"
                 ] mutableCopy];
    
    self.vcs = [@[
              @"MJBaseViewController",
              @"MJExtensionBaseViewController",
              @"MasonryBaseViewController",
              @"PPLabelViewController",
              @"JSViewController",
              @"AnimationBaseViewController",
              @"RuntimeViewController",
              @"YYTextDemoViewController",
              @"AlgorithmViewController"
              ] mutableCopy];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
