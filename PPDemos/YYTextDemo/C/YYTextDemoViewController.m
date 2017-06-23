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
 2. [YYKit之YYText](http://www.cnblogs.com/lujianwenance/p/5716804.html)
 3. [YYText 是如何绘制的](https://github.com/lzwjava/OpenSourceNotes/blob/master/YYText/YYText.md)
 4. [YYText 库学习总结](http://www.jianshu.com/p/60aee32ade55?nomobile=yes)
 6.
 */

{
    YYLabel *_topLB;
    YYLabel *_bottomLB;
    YYLabel *_messLB;
}
@end

@implementation YYTextDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test001];
//    [self test002];
    [self test003];
    
    [self makeBtn];
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.tag = 0;
    [self changeVaildLines:bt];


    
 
    
    
}
-(void)test001
{
//    YYLabel *lb = [YYLabel new];
//    [self.view addSubview:lb];
//    lb.backgroundColor = [UIColor pp_lightGrayColor];
//    lb.numberOfLines = 0;
    
    YYLabel *lb = [YYLabel pp_lbMakeForAttributedWithSuperV:self.view bgColor:[UIColor pp_lightGrayColor] numberOfLines:0];
    
    
    
    lb.frame = CGRectMake(80, 100, ScreenWidth-100, 180);
    lb.text = @"卓越的技能无一例外需要持久练习,卓越的技能无一例外需要持久练习,卓越的技能无一例外需要持久练习";
    
    [lb pp_attributedYYLabelWithTextColor:[UIColor pp_violetColor] font:@15 lineSpacing:14 specialTextColor:[UIColor pp_skyBlueColor] specialTextFont:@18 specialText:@"技能" allStr:lb.text textAligent:NSTextAlignmentCenter];
    
}

-(void)test002
{
    
}


-(void)test003
{
    YYLabel *topLB = [YYLabel new];
    _topLB = topLB;
    topLB.text = @"山上轻松山上花山上轻松上花山上花山\n花间轻松不如她山上花山上轻松\n有朝一日山上花山上花山上花山上花山上花山开花\n上京花园人满山";
    [self.view addSubview:topLB];
    topLB.frame = CGRectMake(50, 100, ScreenWidth-100, 180);
    //如果有换行符“\n”，记得设置numberOfLines为0；
    topLB.numberOfLines = 0;
    topLB.backgroundColor = [UIColor pp_lightGrayColor];
    
//    [topLB pp_attributedYYLabelWithTextColor:[UIColor pp_purpleColor]
//                                        font:@18
//                                 lineSpacing:20
//                               containerSize:CGSizeMake(ScreenWidth-100, CGFLOAT_MAX)
//                       specialTextColorArray:@[[UIColor pp_redColor],[UIColor pp_blueColor]]
//                        specialTextFontArray:@[[UIFont systemFontOfSize:12],[UIFont systemFontOfSize:20],[UIFont systemFontOfSize:18]]
//                            specialTextArray:@[@"山",@"花"]
//                                      allStr:topLB.text
//                                 textAligent:NSTextAlignmentCenter
//                              calculateBlock:^(CGSize size, NSUInteger lineCount) {
//                                  NSLog(@"线程is %@ -- %lu",[NSThread currentThread],(unsigned long)lineCount);
//                                  topLB.frame = CGRectMake(50, 100,ScreenWidth-100 , size.height);
//    }];
    
    

    NSMutableAttributedString *mutStr = [NSMutableAttributedString pp_attributedStringWithText:@"bobo" font:@12 textColor:[UIColor pp_blueColor] lineSpacing:10];
    topLB.truncationToken = mutStr;
    
    topLB.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"text.string is %@",text.string);
    };
    
    
}

-(void)makeBtn
{
    //此处我已知是7
    for (int i = 0; i < 7; i++) {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:bt];
        bt.backgroundColor = [UIColor pp_randomColor];
        bt.frame = CGRectMake(10, 100+50*i, 60, 40);
        [bt setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(changeVaildLines:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag = i;
        
    }
    
}

-(void)changeVaildLines:(UIButton *)btn
{
    _topLB = [YYLabel pp_lbMakeForAttributedWithSuperV:self.view
                                               bgColor:[UIColor whiteColor]
                                         numberOfLines:0];
    
    [_topLB pp_attributedYYLabelWithTextColor:[UIColor pp_purpleColor]
                                         font:@18
                                  lineSpacing:8
                                containerSize:CGSizeMake(ScreenWidth-100, CGFLOAT_MAX)
                        specialTextColorArray:@[[UIColor pp_redColor],[UIColor pp_blueColor]]
                         specialTextFontArray:@[[UIFont systemFontOfSize:12],[UIFont systemFontOfSize:20],[UIFont systemFontOfSize:18]]
                             specialTextArray:@[@"山",@"花"]
                                       allStr:_topLB.text
                                  textAligent:NSTextAlignmentCenter
                                   vaildLines:btn.tag
                               calculateBlock:^(CGSize size, NSUInteger lineCount) {
                                   //        NSLog(@"线程is %@ -- %lu",[NSThread currentThread],(unsigned long)lineCount);
                                 
                                   _topLB.frame = CGRectMake(80, 100,ScreenWidth-100 , size.height+3);

    }];
}

@end
