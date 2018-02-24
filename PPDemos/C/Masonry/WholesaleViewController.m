//
//  WholesaleViewController.m
//  LazyCat
//
//  Created by Abner on 16/6/7.
//  Copyright © 2016年 zhanshu. All rights reserved.
//

#import "WholesaleViewController.h"
#import "WholesaleCell.h"

@interface WholesaleViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //headerV的子控件设置全局变量
    UIImageView *_avatarImgV; //头像
    UILabel *_welcomeLB;
    UILabel *_currentMonthCountLB; //当月进货数量
    UILabel *_todayCountLB;
    UILabel *_clickedShowLB; //在5，5s无法用
}
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation WholesaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = PPSetColor(245, 245, 249, 1);
    [self creatTableView];
    
    
}

-(void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = PPSetColor(245, 245, 249, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    //创建headerview【110+65+12】
    UIView *headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 187)];
    headerV.backgroundColor= [UIColor whiteColor];
    self.tableView.tableHeaderView = headerV;
    
    //设置headerV的子控件
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 110)];
    bgV.backgroundColor = PPSetColorRGBValue(0xf9f9f9, 1.0);
    [headerV addSubview:bgV];
    
    UIImageView *avatar = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2-27, 15, 54, 54)];
    _avatarImgV = avatar;
    avatar.contentMode = UIViewContentModeScaleAspectFit;
    avatar.image = [UIImage imageNamed:@"wholesale_ava"];
    [headerV addSubview:_avatarImgV];
    
    UILabel *welcomeLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 81.5, ScreenWidth, 13)];
    _welcomeLB = welcomeLB;
    welcomeLB.textColor = PPSetColorRGBValue(0x666666, 1.0);
    welcomeLB.textAlignment = NSTextAlignmentCenter;
    welcomeLB.font = [UIFont systemFontOfSize:15];
    welcomeLB.text = @"欢迎您 ，13586565652";
    [headerV addSubview:_welcomeLB];
    
    
    CGFloat midLineW = 1.0;
    CGFloat botViewW = (ScreenWidth - midLineW)/2;
    /**
     上面细线
     */
    UIView *lineV_top = [[UIView alloc]initWithFrame:CGRectMake(0, 110, ScreenWidth, midLineW)];
    lineV_top.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [headerV addSubview:lineV_top];
    
    UILabel *currenMonthLB1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 125, botViewW, 15)];
    currenMonthLB1.textColor = PPSetColorRGBValue(0x757575, 1.0);
    currenMonthLB1.text = @"当月进货(件)";
    currenMonthLB1.textAlignment = NSTextAlignmentCenter;
    currenMonthLB1.font = [UIFont boldSystemFontOfSize:12.0];
    [headerV addSubview:currenMonthLB1];
    
    UILabel *currenMonthLB2 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(currenMonthLB1.frame)+5, botViewW, 16)];
    _currentMonthCountLB = currenMonthLB2;
    currenMonthLB2.textColor = PPSetColorRGBValue(0x000000, 1.0);
    currenMonthLB2.text = @"186";
    currenMonthLB2.textAlignment = NSTextAlignmentCenter;
    currenMonthLB2.font = [UIFont boldSystemFontOfSize:14.0];
    [headerV addSubview:_currentMonthCountLB];
    
    /**
     中间细线
     */
    UIView *lineV = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2-midLineW/2, 125, midLineW, 35)];
    lineV.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [headerV addSubview:lineV];
    
    UILabel *todayLB1 = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2+midLineW/2, 125, botViewW, 15)];
    todayLB1.textColor = PPSetColorRGBValue(0x757575, 1.0);
    todayLB1.text = @"今日进货(件)";
    todayLB1.textAlignment = NSTextAlignmentCenter;
    todayLB1.font = [UIFont boldSystemFontOfSize:12.0];
    [headerV addSubview:todayLB1];
    
    UILabel *todayLB2 = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/2+midLineW/2, CGRectGetMaxY(currenMonthLB1.frame)+5, botViewW, 16)];
    _todayCountLB = todayLB2;
    todayLB2.textColor = PPSetColorRGBValue(0x000000, 1.0);
    todayLB2.text = @"28";
    todayLB2.textAlignment = NSTextAlignmentCenter;
    todayLB2.font = [UIFont boldSystemFontOfSize:14.0];
    [headerV addSubview:_todayCountLB];
    
    /**
     shang线
     */
    UIView *lineV_bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 175, ScreenWidth, 1)];
    lineV_bottom.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [self.tableView addSubview:lineV_bottom];
    
    UIView *V_bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 176, ScreenWidth, 10)];
    V_bottom.backgroundColor = PPSetColor(245, 245, 249, 1);
    [self.tableView addSubview:V_bottom];
    /**
     下线
     */
    UIView *lineV_bottom1 = [[UIView alloc]initWithFrame:CGRectMake(0, 186, ScreenWidth, 1)];
    lineV_bottom1.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [self.tableView addSubview:lineV_bottom1];
    
    _clickedShowLB = [[UILabel alloc]init];
    _clickedShowLB.text = @"点击上面试一试";
    _clickedShowLB.textColor = [UIColor orangeColor];
    _clickedShowLB.textAlignment = NSTextAlignmentCenter;
    [self.tableView.tableFooterView addSubview:_clickedShowLB];
    
    [_clickedShowLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.tableView.tableFooterView).offset(0);
        make.height.equalTo(@100);
    }];
    [self startLBAnimation];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
    
}

#pragma mark - tableView显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#warning pp605 img start

    WholesaleCell *cell =nil;
#warning pp605 img start

//    [WholesaleCell pp_cellMakeWithTableView:nil];
#warning pp605 img start

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [cell setupWholesaleCellData:@[
                                       @"wholesale_pifa_icon",
                                       @"wholesale_dingdan_icon"
                                       ]
                              titles:@[
                                       @"批发进货",
                                       @"订单管理"
                                       ]];
        [cell setWholesaleCellClickedBlock:^(BOOL isLeft) {
            if (isLeft) {
                NSLog(@"批发进货");
                _clickedShowLB.text = @"批发进货";
            }else{
                 NSLog(@"订单管理");
                 _clickedShowLB.text = @"订单管理";
            }

        }];
        
    }else if (indexPath.row == 1){
        [cell setupWholesaleCellData:@[
                                       @"wholesale_dizhi_icon",
                                       @"wholesale_tuichu_icon"
                                       ]
                              titles:@[
                                       @"收货地址",
                                       @"退出登录"
                                       ]];
        [cell setWholesaleCellClickedBlock:^(BOOL isLeft) {
            if (isLeft) {
                NSLog(@"收货地址");
                 _clickedShowLB.text = @"收货地址";
            }else{
                NSLog(@"退出登录");
                 _clickedShowLB.text = @"退出登录";
            }
        }];
        
    }
    
    return cell;
}

-(void)startLBAnimation
{
    //1, 创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    //2, 告诉系统执行什么动画。
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.values = @[@(-M_PI_4 /90.0 * 5),@(M_PI_4 /90.0 * 5),@(-M_PI_4 /90.0 * 5)];
    
    //  3, 执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    
    // 4, 执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 5, 动画执行时间
    keyAnima.duration = 0.2;
    
    // 6, 设置重复次数。 
    keyAnima.repeatCount = MAXFLOAT; 
    
    // 7, 添加核心动画 
    [_clickedShowLB.layer addAnimation:keyAnima forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
