//
//  RACBaseTableViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "RACBaseTableViewController.h"

@interface RACBaseTableViewController ()

@end

@implementation RACBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupArrs];
    
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"rac简单使用demo",
                     @"MVVM最基本的使用"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"RACDemo1ViewController",
                  @"MVVMBasicDemoViewController"
                  ] mutableCopy];
    
}

@end
