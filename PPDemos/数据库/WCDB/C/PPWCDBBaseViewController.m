//
//  PPWCDBBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/12.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPWCDBBaseViewController.h"
@interface PPWCDBBaseViewController ()

@end

@implementation PPWCDBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
    
    
}


-(void)setupArrs
{
    self.titles = [@[
                     @"学点新知识（API学习）"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPLearningBaseViewController"
                  ] mutableCopy];
    
}




@end
