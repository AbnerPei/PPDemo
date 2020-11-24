//
//  MutipleThreadBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "MutipleThreadBaseTableViewController.h"
#import "PPDemo-Swift.h"

@interface MutipleThreadBaseTableViewController ()

@end

@implementation MutipleThreadBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (NSArray *)titles
{
    return @[
        @"栅栏函数",
        @"信号量"
    ];
}


- (NSArray *)vcs
{
    return @[
        @"GCD_BarrierViewController",
        @"GCD_SemaphoreViewController"
    ];
}

@end
