//
//  PPBaseCellDisplayAnimationViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseCellDisplayAnimationViewController.h"

@interface PPBaseCellDisplayAnimationViewController ()

@end

@implementation PPBaseCellDisplayAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"cell由下到上一个一个插入动画"
                     ]
                   mutableCopy];
    self.vcs = [@[
                  @"PPDetailCellDisplyAnimationViewController"
                  ]
                mutableCopy];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
