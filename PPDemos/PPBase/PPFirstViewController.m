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
 
    self.tableView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    self.tableView.showsVerticalScrollIndicator = YES;
    
}

#pragma mark - Scrollview代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint vel = [scrollView.panGestureRecognizer velocityInView:scrollView];
    if (vel.y > 0) {
        // 下拉
        NSLog(@"下拉 %f",vel.y);
    }else
    {
        // 上拉
        NSLog(@"上拉 %f",vel.y);

    }
}
-(void)setupArrs
{
    self.titles = [@[
                     @"MJRefrsh使用Demos",
                     @"Realm使用集合",
                     @"MJExtension使用Demos",
                     @"RAC集中学习",
                     @"TextField限制那些事，一个属性满足你的需求！",
                     @"转场动画",
                     @"cell加载时各种动画",
                     @"Masonry使用Demos",
                     @"Animation Demos",
                     @"Runtime学习",
                     @"YYText使用demos",
                     @"ASDK学习",
                     @"学习系统API知识，练习demos",
                     @"自定义个日历控件",
                     @"架构/地图",
                     @"iOS适配器使用练习s",
                     @"FaceBook开源库使用demo"
                     ] mutableCopy];
    
    self.vcs = [@[
                  
                  @"MJBaseViewController",
                  @"PPRealmBaseViewController",
                  @"MJExtensionBaseViewController",
                  @"RACBaseTableViewController",
                  @"PPTextFieldDemoViewController",
                  @"PPTransitionsViewController",
                  @"PPBaseCellDisplayAnimationViewController",
                  @"MasonryBaseViewController",
                  @"AnimationBaseViewController",
                  @"RuntimeViewController",
                  @"YYTextDemoViewController",
                  @"ASDKViewController",
                  @"LearnSystemAPIBaseViewController",
                  @"PPCustomCalendarViewController",
                  @"PPJiaGouMapBaseViewController",
                  @"PPAdapterBaseTableViewController",
                  @"PPFaceBookBaswViewController"
                  ] mutableCopy];
    
}


@end
