//
//  SingletonViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "SingletonViewController.h"
#import "Singleton.h"
#import "SubSingleton.h"

@interface SingletonViewController ()

@end

@implementation SingletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Singleton *s1 = [Singleton shareInstance];
    Singleton *s2 = [[Singleton alloc] init];
    Singleton *s3 = [s2 copy];
    Singleton *s4 = [s2 mutableCopy];
    NSLog(@"\ns1 %@\ns2 %@\ns3 %@\ns4 %@",s1,s2,s3,s4);
    
    SubSingleton *s11 = [SubSingleton shareInstance];
    SubSingleton *s22 = [[SubSingleton alloc] init];
    SubSingleton *s33 = [s22 copy];
    SubSingleton *s44 = [s22 mutableCopy];
    NSLog(@"\ns11 %@\ns22 %@\ns33 %@\ns44 %@",s11,s22,s33,s44);
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
