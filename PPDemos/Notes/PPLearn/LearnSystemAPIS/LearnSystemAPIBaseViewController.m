//
//  LearnSystemAPIBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "LearnSystemAPIBaseViewController.h"

@interface LearnSystemAPIBaseViewController ()

@end

@implementation LearnSystemAPIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"夯实iOS基本功";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"Quartz 2D学习"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"Quartz2DViewController"
                  ] mutableCopy];
}

@end
