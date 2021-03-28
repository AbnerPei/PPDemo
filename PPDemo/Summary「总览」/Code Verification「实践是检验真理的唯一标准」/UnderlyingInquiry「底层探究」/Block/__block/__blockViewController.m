//
//  __blockViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import "__blockViewController.h"

@interface __blockViewController ()

@end

@implementation __blockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    __block int age = 29;
    
    void (^ChangeAgeBlock)(void) = ^(){
        age = 60;
    };
    
    NSLog(@"11 age is %d",age);
    
    ChangeAgeBlock();
    
    NSLog(@"22 age is %d",age);

}

@end



