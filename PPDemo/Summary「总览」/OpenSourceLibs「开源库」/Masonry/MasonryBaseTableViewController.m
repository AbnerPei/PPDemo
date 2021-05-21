//
//  MasonryBaseTableViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import "MasonryBaseTableViewController.h"

@interface MasonryBaseTableViewController ()

@end

@implementation MasonryBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"仿JD|TB商详跳转评价",
        @"Masonry简单位移动画",
        @"自动撑开",
        @"两个view(前者隐藏,后者前移)"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"MAS_JDGoodsDetailCommentViewController",
        @"MAS_EasyUIMoveViewController",
        @"MAS_AutoSizeViewController",
        @"MAS_TwoViewHiddenViewController"
    ];
}
@end
