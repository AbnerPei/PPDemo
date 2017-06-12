//
//  NSURL+LegalUrl.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSURL+LegalUrl.h"
#import <objc/runtime.h>

@implementation NSURL (LegalUrl)


/**
 重写该方法的好处：
   1.如果项目不需要该category时，可以直接删除
   2.该方法在main.m调用之前调用，（因为：Build Phases 的Compile Sources会先加载，对应的文件【NSURL+LegalUrl.m】），而load方法，是加载该类时必调的
 */
+(void)load
{
    Method URLWithString = class_getClassMethod([NSURL class], @selector(URLWithString:));
    
    Method PPURLWithString = class_getClassMethod([NSURL class], @selector(PP_URLWithString:));
    

    method_exchangeImplementations(URLWithString, PPURLWithString);
    
/*
  runtime学习运用：
 
  class_getInstanceMethod            获取实例对象方法
  class_getClassMethod               获取类方法
  method_exchangeImplementations     交换两个方法
 */
    
}

+(instancetype)PP_URLWithString:(NSString *)URLString
{
    //此处注意了：因为自定义的PP_URLWithString和系统的URLWithString已经交换了，此时如果再调用系统的URLWithString，就是在刚方法了调用PP_URLWithString，而这样就会引起死循环
    NSURL *url = [NSURL PP_URLWithString:URLString];
    if (!url) {
        NSString *warningStr = [NSString stringWithFormat:@"PP警告：该URL【 %@ 】不合法，可能会导致网络请求失败！",URLString];
        NSLog(@"%@",warningStr);
    }
    return url;
}
@end
