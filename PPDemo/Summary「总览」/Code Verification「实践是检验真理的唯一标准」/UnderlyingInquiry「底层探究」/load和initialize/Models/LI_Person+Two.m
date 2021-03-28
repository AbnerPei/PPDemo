//
//  LI_Person+Two.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "LI_Person+Two.h"
#import "PPDemoDebugConfiguration.h"

@implementation LI_Person (Two)

#ifdef k_isEnabledForLoadAndInitialize
+ (void)load
{
    NSLog(@"%s",__func__);
}
#endif

@end
