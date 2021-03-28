//
//  LI_Man+Two.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "LI_Man+Two.h"
#import "PPDemoDebugConfiguration.h"

@implementation LI_Man (Two)

#ifdef k_isEnabledForLoadAndInitialize
+ (void)load
{
    NSLog(@"%s",__func__);
}
#endif

@end
