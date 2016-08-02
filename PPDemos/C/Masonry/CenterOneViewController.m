//
//  CenterOneViewController.m
//  MassonryDemos
//
//  Created by Abner on 16/6/7.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "CenterOneViewController.h"

@interface CenterOneViewController ()
@property (nonatomic,strong) UIView *myView;

@end

@implementation CenterOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupRedView];
    
}
#pragma mark --- 添加一个橘色view，上下左右距离self.view边距都为30
-(void)setupOrangeView
{
    _myView = [UIView new];
    _myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_myView];
    
    //约束要尽量详细，如果只约束3个是不会显示出来的，到约束3个再设置宽高就可以，如红色view
    
    /*
    [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(30+64);
        make.left.equalTo(self.view.left).offset(30);
        make.bottom.equalTo(self.view.bottom).offset(-30);
        make.right.equalTo(self.view.right).offset(-30);
    }];
     */
    
    //上面等价于
    [_myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(30+64, 30, 30, 30));
    }];
    
    /*
     结论:
     1. offset后面是偏移量（上左为正，下右为负，【相对self.view】）
     2. UIEdgeInsetsMake（），里面参数都为正，内边距；
     */
    
    
}
#pragma mark --- 添加一个红view，中心点和self.view相同，宽高各为200
-(void)setupRedView{
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //开发中注意导航栏高度；这个center是self.view的center，即屏幕的center
    //center如果不设置，默认相对是父视图
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);                 // 居中显示
        make.size.mas_equalTo(CGSizeMake(200, 200));    // 设置大小
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
