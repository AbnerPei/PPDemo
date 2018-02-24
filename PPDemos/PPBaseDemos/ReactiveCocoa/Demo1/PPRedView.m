//
//  PPRedView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPRedView.h"

@implementation PPRedView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatBtn];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)creatBtn
{
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(30, 30, 100, 50);
    bt.backgroundColor = [UIColor blueColor];
    [bt setTitle:@"点击" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bt];
}
-(void)ButtonClicked
{
    PPLog(@"redView 响应点击事件了");
}
@end
