//
//  PPAdapterBaseTableViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPAdapterBaseTableViewController.h"

@interface PPAdapterBaseTableViewController ()

@end

@implementation PPAdapterBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupArrs];
    
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"tableCell点击展开"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPAdapterCellExpendViewController"
                  ] mutableCopy];
    
}

@end
