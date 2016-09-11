//
//  LPLevelView使用指导.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/10.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef LPLevelView_____h
#define LPLevelView_____h

#import "ViewController.h"
#import "LPLevelView.h"

@interface ViewController ()
{
    __weak IBOutlet LPLevelView *levelView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //纯代码初始化
    LPLevelView *lView = [LPLevelView new];
    lView.frame = CGRectMake(145, 150, levelView.frame.size.width, levelView.frame.size.height);
    lView.iconColor = [UIColor orangeColor];
    lView.iconSize = CGSizeMake(20, 20);
    lView.canScore = NO;
    lView.animated = YES;
    lView.level = 2;
    [lView setScoreBlock:^(float level) {
        NSLog(@"打分：%f", level);
    }];
    [self.view addSubview:lView];
    
    //storyboard生成
    //    levelView.backgroundColor = [UIColor clearColor];
    //    levelView.iconColor = [UIColor redColor];
    //    levelView.canScore = YES;
    //    levelView.levelInt = YES;
    //    levelView.iconSize = CGSizeMake(20, 20);
    //    levelView.iconFull = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_full"];
    //    levelView.iconHalf = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_half"];
    //    levelView.iconEmpty = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_empty"];
    //    levelView.level = 2.5;
}

@end


#endif /* LPLevelView_____h */
