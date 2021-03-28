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
        @"多线程",
        @"UICollectionView",
        @"Context Menus",
        @"WebKit"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"MultiThreadingBaseTableViewController",
        @"UICollectionViewBaseTableViewController",
        @"ContextMenusViewController",
        @"WebKitBaseTableViewController"
    ];
}

@end
