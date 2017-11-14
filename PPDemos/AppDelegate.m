//
//  AppDelegate.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "NSString+WordCount.h"
#import "PPDebugTool.h"
#import <realm/realm.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    TabBarViewController *tabBarVC = [[TabBarViewController alloc]init];
    self.window.rootViewController = tabBarVC;
    
        
    
    NSString *testStr = @"This is a test. This is only a test.";
    NSUInteger wordCount = [testStr pp_wordCount];
    NSLog(@"wordCount is %ld",wordCount);
    
    NSUInteger givenStrCount = [testStr pp_wordCountWithGivenStr:@"This"];
    NSLog(@"givenStrCount is %ld",givenStrCount);
    
    
#warning 第三步
    
#if kUseScreenShotGesture
    self.screenshotView = [[ScreenShotView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    [self.window insertSubview:self.screenshotView atIndex:0];
    self.screenshotView.hidden = YES;
#endif
    
    
//    NSURL *url = [NSURL URLWithString:@"http://baidu.com/中文"];
    NSURL *url = [[NSURL alloc]initWithString:@"http://baidu.com/中文" relativeToURL:nil];
    
//    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pplog)];
    
//    [self.window.rootViewController.view addGestureRecognizer:tapG];
    
    CGFloat scale = [UIScreen mainScreen].scale;
    NSLog(@"屏幕scale is %f",scale);
    
    [self.window makeKeyAndVisible];
    return YES;
}

//-(void)pplog{
//    NSLog(@"pplog laallalallalallal");
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
+ (AppDelegate* )shareAppDelegate {
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
@end
