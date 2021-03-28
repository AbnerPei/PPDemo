//
//  main.m
//  PPDemo
//007
//  Created by PPAbner on 2020/11/20.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PPDemoDebugConfiguration.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
#ifdef k_isEnabledForLoadAndInitialize
        NSLog(@"appDelegateClassName --- 前");
#endif
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
#ifdef k_isEnabledForLoadAndInitialize
        NSLog(@"appDelegateClassName --- 后");
#endif

    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
