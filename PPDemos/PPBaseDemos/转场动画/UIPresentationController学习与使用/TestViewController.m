//
//  TestViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "TestViewController.h"
#import "MyPresentationConytollrt.h"

@interface TestViewController ()

@end

@implementation TestViewController
- (instancetype)init
{
    if ((self = [super init])) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(0, 0, 100, 30);
    close.center = self.view.center;
    [close setTitle:@"退出" forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = CGRectMake(50, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 50, CGRectGetHeight([UIScreen mainScreen].bounds));
        self.view.frame = rect;
    }];
}

- (void)closeAction:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        self.view.frame = rect;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
        }];
    }];
    
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    if (presented == self) {
        MyPresentationConytollrt *presen = [[MyPresentationConytollrt alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        [presen setHidssView:^{
            [UIView animateWithDuration:0.2 animations:^{
                CGRect rect = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
                self.view.frame = rect;
            } completion:^(BOOL finished) {
                [self dismissViewControllerAnimated:NO completion:^{
                    
                }];
            }];
        }];
        return presen;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
