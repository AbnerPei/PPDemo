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
    
    /*
     // 如何做到,刷新时,只显示菊花动画,其他的都不要呢?
     MJRefreshNormalHeader *nomalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
     self.tableView.mj_header = nomalHeader;
     nomalHeader.lastUpdatedTimeLabel.hidden = YES;
     nomalHeader.stateLabel.hidden = YES;
     
     */
    
    //默认【上拉加载】
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    
    //答简友FDZero问题【28--30，请打开运行】
//    UIView *redv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 120)];
//    redv.backgroundColor = [UIColor redColor];
//    self.tableView.tableHeaderView = redv;

    
    //2018-02-23 更新 --- start
    
    //"不建议使用此属性，开发者请自行控制footer的显示和隐藏。基于安全考虑，在未来的某些版本此属性可能作废"
    
    /*
     //感谢[生活要多点蛋定](http://www.jianshu.com/u/001cb51446ab)
     //Q:第一次运行程序,上拉和下拉的刷新控件都会显示,如果没有网的时候就两个都显示
    // 自动根据有无数据来显示和隐藏（有数据就显示，没有数据隐藏。默认是NO）
    self.tableView.mj_footer.automaticallyHidden = YES;
    */
    
    self.tableView.mj_footer.hidden = YES;
    //记住，如果需要footer的话，需要在数据加载完成后（比如：getNetworkData方法里面），修改为No。
    
    //2018-02-23 更新 --- end

    
}

-(void)refresh
{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%s---%@",__func__,[NSThread currentThread]);

        [self getNetworkData:YES];
    });
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);

    
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
