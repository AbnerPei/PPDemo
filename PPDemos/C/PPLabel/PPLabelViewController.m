//
//  PPLabelViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/24.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPLabelViewController.h"
#import "PPLabel.h"

@interface PPLabelViewController ()

@end

@implementation PPLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    PPLabel *label = [[PPLabel alloc]initWithFrame:CGRectMake(50, 200, 100, 140)];
    label.backgroundColor = [UIColor orangeColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    label.text = @"helloworld";
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    label.verticalAlignment = VerticalAlignmentMidele;
    
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([UILabel class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarList[i];
        NSLog(@"88888------/n%s",ivar_getName(ivar));
    }
    free(ivarList);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
