//
//  SystemAPIBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "SystemAPIBaseTableViewController.h"

@interface SystemAPIBaseTableViewController ()

@end

@implementation SystemAPIBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (NSArray *)titles
{
    return @[
        @"UICollectionView",
        @"Context Menus",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"UICollectionViewBaseTableViewController",
        @"ContextMenusViewController",
    ];
}

@end
