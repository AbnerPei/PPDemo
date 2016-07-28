//
//  MJCustomRefreshViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/16.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJCustomRefreshViewController.h"
#import "MJDIYHeader.h"

@interface MJCustomRefreshViewController ()

@end

@implementation MJCustomRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //MJRefresh自定义刷新控件
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJDIYHeader headerWithRefreshingBlock:^{
        [weakSelf getNetworkData:YES];
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
