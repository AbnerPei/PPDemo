//
//  UICollectionViewBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/17.
//

#import "UICollectionViewBaseTableViewController.h"

@interface UICollectionViewBaseTableViewController ()

@end

@implementation UICollectionViewBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (NSArray *)titles
{
    return @[
        @"minimumLineSpacing和minimumInteritemSpacing",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"MinimumXXSpacingViewController",
    ];
}
@end
