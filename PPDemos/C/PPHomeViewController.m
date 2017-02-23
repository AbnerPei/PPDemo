//
//  PPHomeViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPHomeViewController.h"
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
                 @"JavaScriptCore使用",
                 @"Animation Demos",
                 @"Runtime学习",
                 @"YYText使用demos",
                 @"自定义PPTextfield,各种限制一句话搞定",
                 @"人脸识别（uiimageview+faceaware）",
                 @"日历中添加事件 和 拨打电话常用方式"
                 ] mutableCopy];
    
    self.vcs = [@[
                  
              @"MJBaseViewController",
              @"MJExtensionBaseViewController",
              @"MasonryBaseViewController",
              @"JSViewController",
              @"AnimationBaseViewController",
              @"RuntimeViewController",
              @"YYTextDemoViewController",
              @"PPTextfieldViewController",
              @"PPFaceAwareFillViewController",
              @"CalendarEventViewController"
              ] mutableCopy];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
