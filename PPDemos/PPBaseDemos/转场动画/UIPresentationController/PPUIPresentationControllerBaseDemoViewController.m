//
//  PPUIPresentationControllerBaseDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPUIPresentationControllerBaseDemoViewController.h"
#import "PPUIPresentationControllerPresentedViewController.h"
#import "PPCustomPresentationController.h"

@interface PPUIPresentationControllerBaseDemoViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PPUIPresentationControllerBaseDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setTitle:@"弹出视图" forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor blueColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}

/**
 *  UIPresentationController 是 iOS8 新增的一个 API，用来控制 controller 之间的跳转特效。比如希望实现一个特效，显示一个窗口，大小和位置都是自定义的，并且遮罩在原来的页面上。在之前，可以操作view的一些方法来实现。
 */
-(void)buttonClicked:(UIButton *)btn
{
    PPUIPresentationControllerPresentedViewController *presentedVC = [[PPUIPresentationControllerPresentedViewController alloc]init];
    presentedVC.modalPresentationStyle = UIModalPresentationCustom;// 设置 动画样式
    presentedVC.transitioningDelegate = self;// 此对象要实现 UIViewControllerTransitioningDelegate 协议
    [self presentViewController:presentedVC animated:YES completion:nil];
    
}
#pragma mark - UIViewControllerTransitioningDelegate
// 返回控制控制器弹出动画的对象
/**
 *  参数: presentedViewController     将要跳转到的目标控制器
         presentingViewController    跳转前的原控制器
 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[PPCustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];

}

@end
