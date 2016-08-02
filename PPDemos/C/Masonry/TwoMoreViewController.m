//
//  TwoMoreViewController.m
//  MassonryDemos
//
//  Created by Abner on 16/6/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "TwoMoreViewController.h"

@interface TwoMoreViewController ()

@end

@implementation TwoMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI3];
}

-(void)setupUI3
{
    /*
     3. [初级] 让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
     */
    
    UIView *redV = [UIView new];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    UIView *blueV = [UIView new];
    blueV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueV];
    
    [redV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.view);
//        make.height.equalTo(@150);
//        make.left.equalTo(@10);
//        make.right.mas_offset(blueV.mas_left).offset(-10);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(blueV.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.view);
        make.height.mas_equalTo(@150);
        make.width.equalTo(blueV);
    }];
    
    [blueV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.view).offset(-10);
//        make.left.equalTo(redV.right).offset(10);
//        make.width.centerY.height.equalTo(redV);
        make.left.mas_equalTo(redV.mas_right).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.centerY.height.width.equalTo(redV);
    }];

    
    
}

#warning 还有问题，------？？？
-(void)setupUI4
{
    //4. [中级] 在UIScrollView顺序排列一些view[10个]并自动计算contentSize
    UIScrollView *scrollV = [UIScrollView new];
    scrollV.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrollV];
    
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(84, 20, 20, 20));
    }];
    
    UIView *container = [UIView new];
    [scrollV addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollV);
        make.width.equalTo(scrollV);
    }];
    
    
    UIView *listView = nil;
    
    for (int i = 0; i < 10; i++) {
        UIView *V = [UIView new];
        V.backgroundColor = PPRandomColor;
        
        [V mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            make.height.equalTo(@(30*i));
            
            if (listView) {
                make.top.equalTo(listView.bottom);
            }else{
                make.top.equalTo(container.top);
            }
            
        }];
        
        listView = V;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(listView.bottom);
    }];
    
}

@end
