//
//  PPUIPresentationControllerBaseDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPUIPresentationControllerBaseDemoViewController.h"
#import "PPUIPresentationControllerPresentedViewController.h"
#import "PPPresentationController.h"

@interface PPUIPresentationControllerBaseDemoViewController ()

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
    
    PPPresentationController *p = [[PPPresentationController alloc]initWithPresentedViewController:presentedVC presentingViewController:self];
    //默认是CGRectMake(0, ScreenHeight-300, ScreenWidth, 300);
//    p.presentedViewFrame = CGRectMake(0, ScreenHeight-100, ScreenWidth, 100);
    [p present];
    
}


@end
