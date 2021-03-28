//
//  LI_Man+One.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "LI_Man+One.h"
#import "PPDemoDebugConfiguration.h"

@implementation LI_Man (One)

#ifdef k_isEnabledForLoadAndInitialize
+ (void)load
{
    NSLog(@"%s",__func__);
}
#endif

@end
