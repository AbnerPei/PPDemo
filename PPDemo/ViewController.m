//
//  ViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "ViewController.h"
#import "PPDemo-Swift.h"
#import <PPMaker/PPMaker.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    Person *p = [[Person alloc] init];
    [p sayHelloWorld];
}

- (NSArray *)titles
{
    return @[
        @"MyLibs「我的开源库」",
        @"SystemAPI「系统API」",
        @"Special「专题」",
        @"OpenSourceLibs「开源库」",
        @"实践是检验真理的唯一标准「Code Verification」"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"MyLibsBaseTableViewController",
        @"SystemAPIBaseTableViewController",
        @"SpecialBaseTableViewController",
        @"OpenSourceLibsBaseTableViewController",
        @"CodeVerificationBaseTableViewController"
    ];
}


@end
