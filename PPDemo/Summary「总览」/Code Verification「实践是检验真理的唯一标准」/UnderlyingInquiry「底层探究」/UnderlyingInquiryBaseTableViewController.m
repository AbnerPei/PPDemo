//
//  UnderlyingInquiryBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "UnderlyingInquiryBaseTableViewController.h"

@interface UnderlyingInquiryBaseTableViewController ()

@end

@implementation UnderlyingInquiryBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"Block",
        @"load和initialize",
        @"performSelector"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"UI_BlockBaseTableViewController",
        @"UI_LoadAndInitializeViewController",
        @"PerformSelectorViewController"
    ];
}

@end
