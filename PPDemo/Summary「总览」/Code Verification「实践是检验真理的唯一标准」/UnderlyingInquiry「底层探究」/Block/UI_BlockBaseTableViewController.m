//
//  UI_BlockBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import "UI_BlockBaseTableViewController.h"

@interface UI_BlockBaseTableViewController ()

@end

@implementation UI_BlockBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSArray *)titles
{
    return @[
        @"Block的分类",
        @"__block",
        @"Block实战"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"CategoriesOfBlockViewController",
        @"__blockViewController",
        @"Block1ViewController"
    ];
}

@end
