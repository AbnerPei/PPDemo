//
//  WebKitBaseTableViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/19.
//

#import "WebKitBaseTableViewController.h"

@interface WebKitBaseTableViewController ()

@end

@implementation WebKitBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)titles
{
    return @[
        @"JSContext和JSValue",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"JSContextAndJSValueViewController",
    ];
}

@end
