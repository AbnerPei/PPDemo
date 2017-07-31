//
//  ModalViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}

-(void)dismissViewController {
    [self.delegate dismissViewController:self];
}

@end
