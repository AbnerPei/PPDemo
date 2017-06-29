//
//  UITextView+Event.m
//  AutoSDKTest
//
//  Created by liranhui on 2017/6/28.
//  Copyright © 2017年 liranhui. All rights reserved.
//

#import "UITextView+Event.h"
#import "WKHookUtility.h"
@implementation UITextView (Event)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSel = @selector(setDelegate::);
        SEL swizzleSel = @selector(textViewSwizzle_setDelegate:);
        [WKHookUtility swizzlingInClass:[self class] originalSelector:originalSel swizzledSelector:swizzleSel];
    });
}
- (void)textViewSwizzle_setDelegate:(id<UITextViewDelegate>)delegate
{
    NSString *delegateClassStr = NSStringFromClass([delegate class]);
    if(delegate!=nil && ![delegateClassStr hasPrefix:@"UI"] && ![delegateClassStr hasPrefix:@"_UI"])
    {
        Method actionM = class_getInstanceMethod([delegate class], @selector(textViewDidEndEditing:));
        IMP actionIMP = method_getImplementation(actionM);
        class_addMethod([delegate class], @selector(originalTextViewDidEndEditing:), actionIMP, method_getTypeEncoding(actionM));
        Method swizzle_actionM = class_getInstanceMethod([self class], @selector(swizzle_textViewDidEndEditing:));
        IMP swizzle_actionIMP = method_getImplementation(swizzle_actionM);
        class_replaceMethod([delegate class], @selector(textViewDidEndEditing:), swizzle_actionIMP, method_getTypeEncoding(actionM));    }
    [self textViewSwizzle_setDelegate:delegate];
}
- (void)swizzle_textViewDidEndEditing:(UITextView*)textView
{
    NSLog(@"%@",textView.text);
    [self performSelector:@selector(originalTextViewDidEndEditing:) withObject:textView];
}
@end
