//
//  CoreAnimationBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "CoreAnimationBaseTableViewController.h"

@interface CoreAnimationBaseTableViewController ()

@end

@implementation CoreAnimationBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"CoreAnimation「核心动画」",
        @"MutipleThread「多线程」",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"CoreAnimationBaseTableViewController",
        @"MutipleThreadBaseTableViewController",
    ];
}

@end
