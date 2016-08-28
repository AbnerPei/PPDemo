//
//  MoreViewController.m
//  MassonryDemos
//
//  Created by Abner on 16/6/7.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupFourView];
}

-(void)setupFourView
{
//    UIView *View = [UIView new];
//    View.backgroundColor = [UIColor redColor];
//    [self.view addSubview:View];
//    UIView *blueView = [UIView new];
//    View.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:blueView];
//    UIView *orangeView = [UIView new];
//    View.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:orangeView];
//    UIView *blackView = [UIView new];
//    View.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:blackView];
    
    UIView *purpleView = UIView.new;
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self.view addSubview:purpleView];
    
    UIView *orangeView = UIView.new;
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [purpleView addSubview:orangeView];
    
    //example of using constants
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@84);
        make.left.equalTo(@20);
        make.bottom.equalTo(@-20);
        make.right.equalTo(@-20);
    }];
    
    // auto-boxing macros allow you to simply use scalars and structs, they will be wrapped automatically
    
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(CGPointMake(0, 0));
        make.size.equalTo(CGSizeMake(200, 100));
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
