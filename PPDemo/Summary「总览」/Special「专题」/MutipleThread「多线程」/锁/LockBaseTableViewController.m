//
//  LockBaseTableViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/21.
//

#import "LockBaseTableViewController.h"

@interface LockBaseTableViewController ()

@end

@implementation LockBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"dispatch_semaphore「信号量」",
    ];
}


- (NSArray *)vcs
{
    return @[
        @"dispatch_semaphore_ViewController",
    ];
}

@end
