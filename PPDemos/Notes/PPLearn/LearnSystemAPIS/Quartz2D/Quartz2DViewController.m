//
//  Quartz2DViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//


/*
 ①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳⓪❶❷❸❹❺❻❼❽❾❿⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴
  ♈知识大讲堂♈
 
  一、Quartz2D是什么？能干什么？
     ➤ Quartz2D是一个二维绘图引擎，支持iOS和Mac系统；
     ➤ Quartz2D能完成的工作如下：
       ➥ 绘制图形：线条/三角形/矩形/圆/弧等；
       ➥ 绘制文字；
       ➥ 绘制/生成图片（图像）；
       ➥ 读取/生成PDF；
       ➥ 截图/裁剪图片；
       ➥ 自定义UI控件；
       ➥ ➥ ➥ .......
 
  二、如何利用Quartz2D回执东西到view上？
     ➤ 首先，得到图形上下文，因为它能保存绘图信息，并且决定着绘制到什么地方去；
     ➤ 其次，那个图形上下文必须跟view相关联，才能将内容绘制到view上。
  
  三、自定义view的步骤：
     ➤ 新建一个类，继承自UIView；
     ➤ 实现- (void)drawRect:(CGRect)rect方法，然后在这个方法中：
       ➥ 获取跟当前view相关联的图形上下文；
       ➥ 绘制响应的图形内容
       ➥ 利用图形上下文将绘制的所有内容渲染显示到view上。
 */

#import "Quartz2DViewController.h"
#import "Quartz2DFirstCustomView.h"

@interface Quartz2DViewController ()

@end

@implementation Quartz2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Quartz2D学习";
    [self creatSelfUI];
}

-(void)creatSelfUI
{
    Quartz2DFirstCustomView *customV = [Quartz2DFirstCustomView new];
    [self.view addSubview:customV];
    customV.frame = CGRectMake(50, 90, 200, 240);
    customV.backgroundColor = [UIColor pp_tomatoColor];
}

@end
