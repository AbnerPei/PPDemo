//
//  PPToolsHelper.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPToolsHelper.h"

@implementation PPToolsHelper
+(void)pp_tool_phone:(NSString *)phoneNO isUseWebView:(BOOL)isUseWebV
{
    //[【原】iOS学习之三种拨打电话方式的比较](http://www.cnblogs.com/gfxxbk/p/5976626.html)
    
    NSString *tel = [NSString stringWithFormat:@"tel://%@",phoneNO];
    if (isUseWebV) {
        //2、推荐使用
        UIWebView *webView = [[UIWebView alloc]init];
        
        NSURL *url = [NSURL URLWithString:tel];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        [[UIApplication sharedApplication].keyWindow addSubview:webView];
        
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
    }
}
@end
