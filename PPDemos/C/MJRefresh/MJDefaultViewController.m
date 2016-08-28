//
//  MJDefaultViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJDefaultViewController.h"

@interface MJDefaultViewController ()

@end

@implementation MJDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //默认【下拉刷新】
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    //默认【上拉加载】
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
    //答简友FDZero问题【28--30，请打开运行】
//    UIView *redv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 120)];
//    redv.backgroundColor = [UIColor redColor];
//    self.tableView.tableHeaderView = redv;
}

-(void)refresh
{
    [self getNetworkData:YES];
}
-(void)loadMore
{
    [self getNetworkData:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
