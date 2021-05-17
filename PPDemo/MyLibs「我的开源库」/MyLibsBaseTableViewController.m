//
//  MyLibsBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "MyLibsBaseTableViewController.h"

@interface MyLibsBaseTableViewController ()

@end

@implementation MyLibsBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"VVStandardizedCode「标准化代码」",
        @"PPTextField「设置各种输入限制」",
        @"PPMaker「快速开发」",
        @"PPCarousel「万能轮播」"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"VVStandardizedCodeViewController",
        @"PPTextFieldBaseTableViewController",
        @"PPMakerBaseTableViewController",
        @"PPCarouselBaseTableViewController",
    ];
}

@end
