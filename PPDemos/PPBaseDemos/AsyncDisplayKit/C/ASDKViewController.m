//
//  ASDKViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "ASDKViewController.h"
#import "YYText.h"


@interface ASDKViewController ()

@end

@implementation ASDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ASDK示例";
    
    YYLabel *lb = [YYLabel new];
    [self.view addSubview:lb];
    lb.numberOfLines = 0;
    
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc]initWithString:@"暂时还没有去学习，最近在看YYLabel,后续会更新的！"];
    [mutStr yy_setKern:@8 range:[mutStr.string rangeOfString:@"YYLabel"]];
    lb.attributedText = mutStr;
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
