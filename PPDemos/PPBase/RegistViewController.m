//
//  RegistViewController.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/11/24.
//  Copyright © 2016年 Guda wei. All rights reserved.
//

#import "RegistViewController.h"


@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
//    self.labTitle.text = @"注册";
    
//    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
  
    UIButton * bt = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    bt.backgroundColor = [UIColor redColor];
    [bt addTarget:self action:@selector(ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
}
-(void)ButtonClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
