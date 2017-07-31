//
//  AnimationBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/29.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AnimationBaseViewController.h"
#import "AnimationShowViewController.h"

@interface AnimationBaseViewController ()

@end

@implementation AnimationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS Animation";
    [self setupArrs];
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"animation示例",
                     @"layer动画学习"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"AnimationShowViewController",
                  @"PPLayerAnimationsViewController"
                  ] mutableCopy];

}

@end
