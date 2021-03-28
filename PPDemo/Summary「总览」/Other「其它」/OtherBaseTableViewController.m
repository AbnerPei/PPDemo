//
//  OtherBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "OtherBaseTableViewController.h"

@interface OtherBaseTableViewController ()

@end

@implementation OtherBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"单例「严谨的单例和可继承的单例」",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"SingletonViewController",
    ];
}

@end
