//
//  UIView+StringTag.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIView+StringTag.h"
#import <objc/runtime.h>

@implementation UIView (StringTag)
-(NSString *)pp_strTag
{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setPp_strTag:(NSString *)pp_strTag
{
    return objc_setAssociatedObject(self, @selector(pp_strTag), pp_strTag, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)pp_viewWithStrTag:(NSString *)strTag
{
    if (strTag.length == 0 || !strTag) {
        return nil;
    }
    for (UIView *aV in self.subviews) {
        NSString *tagS = aV.pp_strTag;
        if ([tagS isEqualToString:strTag]) {
            return aV;
        }
    }
    return nil;
}
@end
