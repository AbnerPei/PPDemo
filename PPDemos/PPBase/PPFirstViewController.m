//
//  PPFirstViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/24.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPFirstViewController.h"

@interface PPFirstViewController ()

@end

@implementation PPFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
 
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"MJRefrsh使用Demos",
                     @"MJExtension使用Demos",
                     @"Masonry使用Demos",
                     @"Animation Demos",
                     @"Runtime学习",
                     @"YYText使用demos"
                     ] mutableCopy];
    
    self.vcs = [@[
                  
                  @"MJBaseViewController",
                  @"MJExtensionBaseViewController",
                  @"MasonryBaseViewController",
                  @"AnimationBaseViewController",
                  @"RuntimeViewController",
                  @"YYTextDemoViewController"

                  ] mutableCopy];
    
}


@end
