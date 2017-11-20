//
//  PPRealmBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPRealmBaseViewController.h"

@interface PPRealmBaseViewController ()

@end

@implementation PPRealmBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupArrs];
}

-(void)setupArrs
{
    self.titles = [@[
                     @"百思不得姐"
                     ] mutableCopy];
    self.vcs = [@[
                  @"RealmBSViewController"
                  ] mutableCopy];
}

@end
