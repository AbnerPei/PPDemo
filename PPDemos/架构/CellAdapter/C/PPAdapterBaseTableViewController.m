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
                     @"tableCell点击展开",
//                     @"cell随着输入框文字高度变化（不推荐）",
                     @"cell高度随文字输入变化（推荐）"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPAdapterCellExpendViewController",
//                  @"PPCellAutoHeightViewController",
                  @"ACEViewController"
                  ] mutableCopy];
    
}

@end
