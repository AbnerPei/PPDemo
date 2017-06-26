//
//  NSString+ContainsString.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+ContainsString.h"
#import <objc/runtime.h>

@implementation NSString (ContainsString)
+(void)load
{
    Method systemContainsString = class_getInstanceMethod([self class], @selector(containsString:)); //NS_AVAILABLE(10_10, 8_0)
    Method ppContainsString = class_getInstanceMethod([self class], @selector(pp_containsString:));
    method_exchangeImplementations(systemContainsString, ppContainsString);
    
}
-(BOOL)pp_containsString:(NSString *)str
{
    //字符串不为空
    if (self.length == 0 || str.length == 0) {
        return NO;
    }else if (PPVersion_Category(8.0)) {
        return [self pp_containsString:str];
    }else{
        return [self rangeOfString:str].location != NSNotFound;
    }
}
@end
