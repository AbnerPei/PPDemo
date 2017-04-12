//
//  PPFirstViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/24.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPFirstViewController.h"

@interface PPFirstViewController ()

@end

@implementation PPFirstViewController

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
                     @"TextField限制那些事，一个属性满足你的需求！",
                     @"cell加载时各种动画",
                     @"Masonry使用Demos",
                     @"Animation Demos",
                     @"Runtime学习",
                     @"YYText使用demos",
                     @"ASDK学习",
                     @"学习系统API知识，练习demos",
                     @"自定义个日历控件"
                     ] mutableCopy];
    
    self.vcs = [@[
                  
                  @"MJBaseViewController",
                  @"MJExtensionBaseViewController",
                  @"PPTextFieldDemoViewController",
                  @"PPBaseCellDisplayAnimationViewController",
                  @"MasonryBaseViewController",
                  @"AnimationBaseViewController",
                  @"RuntimeViewController",
                  @"YYTextDemoViewController",
                  @"ASDKViewController",
                  @"LearnSystemAPIBaseViewController",
                  @"PPCustomCalendarViewController"
                  ] mutableCopy];
    
}


@end
