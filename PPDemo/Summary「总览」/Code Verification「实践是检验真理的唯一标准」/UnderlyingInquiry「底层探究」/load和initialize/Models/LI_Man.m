//
//  LI_Man.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "LI_Man.h"
#import "PPDemoDebugConfiguration.h"

@implementation LI_Man

#ifdef k_isEnabledForLoadAndInitialize
+ (void)load
{
    NSLog(@"%s",__func__);
}
#endif

@end
