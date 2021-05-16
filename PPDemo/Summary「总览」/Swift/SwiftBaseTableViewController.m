//
//  SwiftBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/4/25.
//

#import "SwiftBaseTableViewController.h"
#import "PPDemo-Swift.h"

@interface SwiftBaseTableViewController ()

@end

@implementation SwiftBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"函数",
        @"闭包",
    ];
}

- (NSArray *)vcs
{
    return @[
        [[FunctionViewController alloc] init],
        [[ClosureDemoViewController alloc] init],
    ];
}


@end
