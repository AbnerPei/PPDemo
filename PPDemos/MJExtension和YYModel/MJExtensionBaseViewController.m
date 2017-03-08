//
//  MJExtensionBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJExtensionBaseViewController.h"

@implementation MJExtensionBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MJExtensionDemos";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"MJExtension 格式转换"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"MJExtensionViewController"
                  ] mutableCopy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
