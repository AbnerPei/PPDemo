//
//  YYTextDemoViewController.m
//  PPDemos
//
//  Created by Abner on 16/9/12.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "YYTextDemoViewController.h"
@interface YYTextDemoViewController ()
/*
 0. [专访YYKit作者郭曜源：开源大牛是怎样炼成的](http://www.infoq.com/cn/news/2015/11/ibireme-interview?utm_content=homepage)
 1. [iOS开发学习之YYKit中YYText的深入解析，YYTextShadow的代码解析](http://blog.csdn.net/zhonggaorong/article/details/51482738)
 2. [YYKit之YYText](http://www.cnblogs.com/lujianwenance/p/5716804.html)
 3. [YYText 是如何绘制的](https://github.com/lzwjava/OpenSourceNotes/blob/master/YYText/YYText.md)
 4. [YYText 库学习总结](http://www.jianshu.com/p/60aee32ade55?nomobile=yes)
 5. [ 使用YYText-文本蓝色文字点击实现超链接跳转](http://blog.csdn.net/justinaelx/article/details/52077610)
 6. 
 */
@end

@implementation YYTextDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTopLB];
    [self setupBottomLB];
}
-(void)setupTopLB
{
    YYLabel *topLB = [YYLabel new];
    topLB.text = @"山上轻松山上花，\n花间轻松不如她。";
    [self.view addSubview:topLB];
    topLB.frame = CGRectMake(50, 100, ScreenWidth-100, 80);
    topLB.textAlignment = NSTextAlignmentCenter;
    //如果有换行符“\n”，记得设置numberOfLines为0；
    topLB.numberOfLines = 0;
    topLB.backgroundColor = [UIColor cyanColor];
}
-(void)setupBottomLB
{
    YYLabel *bottomLB = [YYLabel new];
    bottomLB.text = @"有朝一日寒风雨，\n只见青松不见花。";
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc]initWithString:bottomLB.text];
    CGSize introSize = CGSizeMake(ScreenWidth-100, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:mutStr];
    bottomLB.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    CGFloat introWidth = layout.textBoundingSize.width;
//    bottomLB.attributedText = mutStr;
    [self.view addSubview:bottomLB];
    bottomLB.frame = CGRectMake(50, 200, introWidth, introHeight);
    bottomLB.backgroundColor = [UIColor lightGrayColor];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
