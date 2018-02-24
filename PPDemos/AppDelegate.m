//
//  AppDelegate.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "PPDebugTool.h"
#import <realm/realm.h>
#import <CommonCrypto/CommonDigest.h>

#import "NSDate+Helper.h"
#import "NSDate+EasyDateHelper.h"
#import "NSDateFormatter+Helper.h"
#import "NSDateFormatter+EasyDateFormatterHelper.h"

@interface AppDelegate ()

@end

@interface AppDelegate (URLSessionDelegate)<NSURLSessionDelegate>

@end

@implementation AppDelegate

-(void)urlSessionConfigurationTest
{
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSLog(@"default identifier is %@",defaultConfiguration.identifier);
    
    NSURLSessionConfiguration *ephemeralConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSLog(@"ephemeral identifier is %@",ephemeralConfiguration.identifier);
    
    NSURLSessionConfiguration *backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"pp_backgroundIdentifier"];
    NSLog(@"background identifier is %@",backgroundConfiguration.identifier);
    
    //不是这样用的（想想腾讯视频 缓存任务的逻辑）
    BOOL allowsCellularAccess = defaultConfiguration.allowsCellularAccess;
    NSLog(@"是否允许移动网 %d",allowsCellularAccess);
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfiguration];
    NSLog(@"sessionDescription is %@",session.sessionDescription);
}
-(void)urlSessionTest
{
    [self getSessionTest01];

}
-(void)getSessionTest01
{
    //http://c.3g.163.com/photo/api/list/0096/4GJ60096.json
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operationQueue];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://c.3g.163.com/photo/api/list/0096/4GJ60096.json"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //拿到响应头信息
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        
        //4.解析拿到的响应数据
        NSLog(@"解析拿到的响应数据 %@\n%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding],res.allHeaderFields);
    }];
    
    [dataTask resume];
    
    
}
-(void)dateTest{
    NSString *dateStr1 = @"2018-01-09 21:15:00";
    NSString *dateStr2 = @"2018-01-09 23:40:00";
    NSInteger p1 = [NSDate pp_dateIntervalBetweenADateStr:dateStr1 bDateStr:dateStr2 dateStyle:PPNSDateStyleLine_yyyyMMdd_HHmmss];
    NSInteger p2 = [NSDate pp_dateIntervalBetweenADateStr:dateStr2 bDateStr:dateStr1 dateStyle:PPNSDateStyleLine_yyyyMMdd_HHmmss];
    NSInteger p3 = labs(p2);
    PPLog(@"p1 is %ld \n p2 is %ld \n p3 is %ld",(long)p1,(long)p2,(long)p3);
    
    NSString *a = @"20TT7888T09";
    NSString *b = [a stringByReplacingOccurrencesOfString:@"T" withString:@"波"];
    PPLog(@"a is %@\n b is %@",a,b);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    TabBarViewController *tabBarVC = [[TabBarViewController alloc]init];
    self.window.rootViewController = tabBarVC;
    
//    [self urlSessionTest];
    
    
    [self dateTest];
    
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

+ (AppDelegate* )shareAppDelegate {
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

@end

@implementation AppDelegate (URLSessionDelegate)

-(void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error
{
    NSLog(@"%s",__func__);
}
-(void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    NSLog(@"%s",__func__);

}
-(void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    NSLog(@"%s",__func__);

}
@end
