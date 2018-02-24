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
    
    [self test001];
    [self test002];
    
    
}

-(void)test002
{
    
    YYLabel *lb = [YYLabel pp_lbMakeForAttributedWithSuperV:self.view bgColor:[UIColor lightGrayColor] numberOfLines:0];
        
    lb.frame = CGRectMake(10, 450, ScreenWidth-100, 100);
    lb.text = @"卓越的技能无一例外需要持久练习,卓越的技能无一例外需要持久练习,卓越的技能无一例外需要持久练习";
    
    [lb pp_attributedWithText:lb.text font:@"15" kern:1 textColor:[UIColor purpleColor] lineSpacing:4 textAligent:NSTextAlignmentCenter specialText:@"技能" specialTextFont:@"18" specialTextColor:[UIColor blueColor]];
    
}




-(void)test001
{
    
    [self makeBtn];

    
    YYLabel *topLB = [YYLabel new];
    _topLB = topLB;
    NSString *textStr = @"山上轻松山上花山上轻松上花山上花山\n花间轻松不如她山上花山上轻松\n有朝一日山上花山上花山上花山上花山上花山开花\n上京花园人满山";
    [self.view addSubview:topLB];
    topLB.frame = CGRectMake(80, 100, ScreenWidth-100, 180);
    //如果有换行符“\n”，记得设置numberOfLines为0；
    topLB.numberOfLines = 0;
    topLB.backgroundColor = [UIColor lightGrayColor];

    NSMutableAttributedString *mutStr = [NSMutableAttributedString pp_attributedStringWithText:@"bobo" font:@"10" kern:4 textColor:[UIColor blueColor] lineSpacing:14 textAligent:NSTextAlignmentCenter];
    topLB.truncationToken = mutStr;
    
    topLB.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"text.string is %@",text.string);
    };

    
    [_topLB pp_attributedWithText:textStr font:@"18" kern:4 textColor:[UIColor purpleColor] lineSpacing:8 textAligent:NSTextAlignmentCenter specialTextArray:@[@"山",@"花"] specialTextFontArray:@[[UIFont systemFontOfSize:12],[UIFont systemFontOfSize:20],[UIFont systemFontOfSize:18]] specialTextColorArray:@[[UIColor redColor],[UIColor blueColor]]];
    
    //        BTN CATEGORY
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.tag = 0;
    [self changeVaildLines:bt];
    
    
}

-(void)makeBtn
{
    //此处我已知是7
    for (int i = 0; i < 7; i++) {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:bt];
        bt.backgroundColor = [UIColor purpleColor];
        bt.frame = CGRectMake(10, 100+50*i, 60, 40);
        [bt setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(changeVaildLines:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag = i;
        
    }
    
}

-(void)changeVaildLines:(UIButton *)btn
{
    CGSize lbSize = [YYLabel pp_calculateSizeWithContainerSize:CGSizeMake(ScreenWidth-100, CGFLOAT_MAX) attributedStr:(NSMutableAttributedString *)_topLB.attributedText calculateForType:PPCalculateSizeForTypeYYLabel maxLine:btn.tag];
    _topLB.frame = CGRectMake(80, 100, ScreenWidth-100, lbSize.height);
   
}

@end
