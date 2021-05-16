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
        @"CABasicAnimation",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"CABasicAnimationViewController",
    ];
}

@end
