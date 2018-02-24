//
//  MJDefaultBlockViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJDefaultBlockViewController.h"
#import "MJRefreshWantedFooter.h"

@interface MJDefaultBlockViewController ()<UIScrollViewDelegate>

@end

@implementation MJDefaultBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak typeof(self) weakSelf = self;
    //默认block方法：设置下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf getNetworkData:YES];
        weakSelf.tableView.mj_footer.hidden = NO;
    }];
    
    
    //默认block方法：设置上拉加载更多
    MJRefreshWantedFooter *wantedFooter = [MJRefreshWantedFooter mj_wantedFooterWithBottomExtraHeight:50 nomalRecommenderText:@"上拉关闭当前页" extraRecommenderText:@"释放关闭当前页"];
    self.tableView.mj_footer = wantedFooter;
    wantedFooter.wantedActionBlock = ^{
        NSLog(@"用来返回你想要的网易新闻那种效果");
    };
    
    
    
    //2018-02-23 update
//    /** 自动根据有无数据来显示和隐藏（有数据就显示，没有数据隐藏。默认是NO） */
//    self.tableView.mj_footer.automaticallyHidden = YES;

}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (scrollView == self.tableView) {
//        NSLog(@"%s %@",__func__,NSStringFromCGPoint(self.tableView.contentOffset));
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
