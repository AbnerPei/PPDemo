//
//  MJAnimationImageViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/16.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJAnimationImageViewController.h"

@interface MJAnimationImageViewController ()

@end

@implementation MJAnimationImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //样式一：设置一张图片（无动画效果）
//    NSArray *idleImages = [NSArray arrayWithObject:[UIImage imageNamed:@"xiala_icon.png"]];
    //样式二：设置多张图片（有动画效果）
    NSArray *idleImages = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"dropdown_loading_01.png"],
                           [UIImage imageNamed:@"dropdown_loading_02.png"],
                           [UIImage imageNamed:@"dropdown_loading_03.png"],nil];

    NSArray *pullingImages = [NSArray arrayWithObject:[UIImage imageNamed:@"shifang_icon.png"]];
    NSArray *refreshingImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"load_view_01.png"],
                                 [UIImage imageNamed:@"load_view_02.png"],
                                 [UIImage imageNamed:@"load_view_03.png"],
                                 [UIImage imageNamed:@"load_view_04.png"],
                                 [UIImage imageNamed:@"load_view_05.png"],
                                 [UIImage imageNamed:@"load_view_06.png"],
                                 [UIImage imageNamed:@"load_view_07.png"],
                                 [UIImage imageNamed:@"load_view_08.png"],
                                 [UIImage imageNamed:@"load_view_09.png"],
                                 [UIImage imageNamed:@"load_view_010.png"], nil];

//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(animationRefresh)];
    
    //-------以下是使用block方法【不包含animationRefresh方法】,动画设置在上面的部分代码---------
    
    __weak typeof(self) weakSelf = self;
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf getNetworkData:YES];
    }];
    
    //-------以上是使用block方法【不包含animationRefresh方法】,动画设置在上面的部分代码---------
    
    //1.设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    //2.设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    //3.设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    self.tableView.mj_header = header;
    
#pragma mark --- 下面两个设置根据各自需求设置
//    // 隐藏更新时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    
//    // 隐藏刷新状态
//    header.stateLabel.hidden = YES;
   
#pragma mark --- 自定义刷新状态和刷新时间文字【当然了，对应的Label不能隐藏】
    // Set title
    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    // Set font
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // Set textColor
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
}

-(void)animationRefresh
{
    [self getNetworkData:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
