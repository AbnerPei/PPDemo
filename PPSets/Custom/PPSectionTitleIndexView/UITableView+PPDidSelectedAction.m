//
//  UITableView+PPDidSelectedAction.m
//  ZMBCY
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 Brance. All rights reserved.
//

#import "UITableView+PPDidSelectedAction.h"
#import <objc/runtime.h>

// tableView点击方法通知名字，无用，暂时留着，配合下面的注释看。
// NSString *const PPTableViewDidSelectedNotificationKey = @"PPTableViewDidSelectedNotificationKey";

@implementation UITableView (PPDidSelectedAction)
-(PPTableViewDidSelectedBlcok)pp_didSelectedBlock
{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setPp_didSelectedBlock:(PPTableViewDidSelectedBlcok)pp_didSelectedBlock
{
    return objc_setAssociatedObject(self, @selector(pp_didSelectedBlock), pp_didSelectedBlock, OBJC_ASSOCIATION_RETAIN);
}

+(void)load
{
    swizzExchange([UITableView class], @selector(setDelegate:), @selector(pp_setDelegate:));
}
///**
// * 通过给定的方法名和实现，动态给类添加一个方法
// *
// * @param cls   要添加方法的类.
// * @param name  指定了方法名的要添加到类的方法.
// * @param imp   添加方法的函数实现（函数地址).
// * @param types 函数的类型，(返回值+参数类型).
// *
// * @return      如果添加成功就返回YES，失败返回NO（如果该类中已经存在一个相同的方法名的方法实现）.
// *
// * @note        注: class_addMethod将重写父类的实现，但是不会替换该类中已经有的实现，
//                如果想改变该类中已有的实现，请使用method_setImplementation
// */
//OBJC_EXPORT BOOL class_addMethod(Class cls, SEL name, IMP imp,const char * types)

-(void)pp_setDelegate:(id<UITableViewDelegate>)delegate
{
    if(delegate){
        //系统原生的didSelected方法
        SEL systemDidSelectedSelector = @selector(tableView:didSelectRowAtIndexPath:);
        //我自己重写的didSelected方法（用于替换系统的）
        SEL ppDidSelectedSelector     = @selector(pp_tableView:didSelectRowAtIndexPath:);
        //VIP：假的didSelected方法（和系统原生的didSelected方法指针地址相同，但不是一个方法，却响应同样事件）
        SEL fakeDidSelectedSelector   = @selector(pp_fakeTableView:didSelectRowAtIndexPath:);

        if ([delegate respondsToSelector:systemDidSelectedSelector]) {
            
            //系统的代理didSelected方法和对应的指针
            Method systemDidSelectedMethod = class_getInstanceMethod([delegate class], @selector(tableView:didSelectRowAtIndexPath:));
            IMP systemDidSelectedMethodIMP = method_getImplementation(systemDidSelectedMethod);
            
            //VIP：此处给系统原生的didSelected方法上添加新的方法（只要方法名不一样，就可以成功，详见系统api中的@return说明）
            //注意此方法放置位置，不能放在下面的class_replaceMethod后面（因为已经被替换了，指针会指向tableView *的pp_tableView:didSelectRowAtIndexPath:）
            class_addMethod([delegate class], fakeDidSelectedSelector, systemDidSelectedMethodIMP, method_getTypeEncoding(systemDidSelectedMethod));

            //自己重写的didSelected，用来处理拦截后想做的事情（比如：发通知，block回调等）
            Method ppDidSelectedMethod = class_getInstanceMethod([self class], ppDidSelectedSelector);
            IMP ppDidSelectedMethodIMP = method_getImplementation(ppDidSelectedMethod);
            
            //用自己重写的替换系统原生的
            class_replaceMethod([delegate class], systemDidSelectedSelector, ppDidSelectedMethodIMP, method_getTypeEncoding(systemDidSelectedMethod));
        }
    }
    //拦截原生的delegate，别忘了调用（此处调用pp_setDelegate:实际上就是调用setDelegate:，说句不该说的话，此处看不懂，runtime你根本不会）
    [self pp_setDelegate:delegate];
}

-(void)pp_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //方案(通知)都用的到的通知，很显然太费事，不方便
    /*
    NSNotification *not = [[NSNotification alloc]initWithName:PPTableViewDidSelectedNotificationKey object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:not];
     */
    
    //方案（runtime）：给tableView添加点击block，。。。。嗯，有没有想到更多？？简化所有的delegate与dataSource方法，此处不说太多
    if (tableView.pp_didSelectedBlock) {
        tableView.pp_didSelectedBlock(tableView, indexPath);
    }
    
    //VIP: 此时，系统原生的didSelected方法已经被拦截，并且做了你想做的事情，可是怎么让系统原生的didSelected还能响应点击？
    /*
     方案一： 不用class_addMethod方法，而是在[delegate respondsToSelector:systemDidSelectedSelector]条件语句里
     添加代理绑定：
     objc_setAssociatedObject(PPTableViewDidSelectedNotificationKey, @selector(pp_tableView:didSelectRowAtIndexPath:), delegate, OBJC_ASSOCIATION_RETAIN);
     然后在此处，执行：
     id ppDelegate = objc_getAssociatedObject(PPTableViewDidSelectedNotificationKey, _cmd);
     [ppDelegate pp_tableView:tableView didSelectRowAtIndexPath:indexPath];
     哦😯，傻了，这相当于直接调用系统的didSelected方法，/(ㄒoㄒ)/~~，错！错！错！
     */
    
    //方案二：利用NSInvocation底层发消息，如下：
    SEL fakeDidSelectedSelector = @selector(pp_fakeTableView:didSelectRowAtIndexPath:);
    NSMethodSignature *methodSignature = [[tableView.delegate class]instanceMethodSignatureForSelector:fakeDidSelectedSelector];
    if (methodSignature == nil) {
        //可以抛出异常也可以不操作。
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = tableView.delegate;
    invocation.selector = fakeDidSelectedSelector;
    //【vip】此处需要把tableView和indexPath这两个原始方法里传递的参数，传过去，否则原始方法里的参数都为nil.
    //注意：设置参数的索引时不能从0开始，因为0已经被self占用，1已经被_cmd占用
    [invocation setArgument:&tableView atIndex:2];
    [invocation setArgument:&indexPath atIndex:3];
    [invocation retainArguments];
    [invocation invoke];
}


#pragma mark --- 【内部】（交换同一个类两个方法）
static inline void swizzExchange(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod){
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@end
