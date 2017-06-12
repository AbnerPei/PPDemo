//
//  UIPresentationDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIPresentationDemoViewController.h"
#import "TestViewController.h"

@interface UIPresentationDemoViewController ()

@end

@implementation UIPresentationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor  = [UIColor brownColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 100, 100)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnnnn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnnnn{
    TestViewController *testVC = [[TestViewController alloc] init];
    [self presentViewController:testVC animated:NO completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
