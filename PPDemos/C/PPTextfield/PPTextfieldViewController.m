//
//  PPTextfieldViewController.m
//  PPDemos
//
//  Created by Abner on 16/10/10.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPTextfieldViewController.h"
#import "PPTextfield.h"

@interface PPTextfieldViewController ()
{
    PPTextfield *_tf;
}
@end

@implementation PPTextfieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    PPTextfield *tf = [[PPTextfield alloc]initWithFrame:CGRectMake(50, 100, ScreenWidth-100, 50)];
    _tf = tf;
    tf.backgroundColor = [UIColor lightGrayColor];
    tf.placeholder = @"test";
    [self.view addSubview:tf];
    
    //    tf.isOnlyNumber = YES;
//        tf.maxNumberCount = 8;
    
    //    tf.isPrice = YES;
    //    tf.isPriceHeaderPoint = YES;
    
    tf.maxCharactersLength = 10;
    tf.maxTextLength = 9;
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
