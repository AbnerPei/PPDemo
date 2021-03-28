//
//  MultiThreadingBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/18.
//

#import "MultiThreadingBaseTableViewController.h"

@interface MultiThreadingBaseTableViewController ()

@end

@implementation MultiThreadingBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"NSOperation",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"NSOperationViewController",
    ];
}

@end
