//
//  LI_Person.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/14.
//

#import "LI_Person.h"
#import "PPDemoDebugConfiguration.h"

@implementation LI_Person

#ifdef k_isEnabledForLoadAndInitialize
+ (void)load
{
    NSLog(@"%s",__func__);
}
#endif

- (void)eatFood
{
    NSLog(@"person eatFood");
}

@end
