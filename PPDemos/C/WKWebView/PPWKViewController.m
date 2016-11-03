//
//  PPWKViewController.m
//  PPDemos
//
//  Created by Abner on 2016/10/20.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

/*
 参考资料：
     1. [IOS进阶之WKWebView](http://www.jianshu.com/p/4fa8c4eb1316)
 
    WKWebView有两个delegate,WKUIDelegate 和 WKNavigationDelegate。
    WKNavigationDelegate主要处理一些跳转、加载处理操作，
    WKUIDelegate主要处理JS脚本，确认框，警告框等。
    因此WKNavigationDelegate更加常用。

 */
#import "PPWKViewController.h"
#import <WebKit/WebKit.h>
@interface PPWKViewController ()<WKUIDelegate,WKNavigationDelegate>
{
    WKWebView *wkWebView;
}
@end

@implementation PPWKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    wkWebView = [[WKWebView alloc]init];
    [self.view addSubview:wkWebView];
    wkWebView.frame = self.view.bounds;
    wkWebView.UIDelegate = self;
    wkWebView.navigationDelegate = self;
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    PPLog(@" %s 页面开始加载时调用",__func__);
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    PPLog(@" %s 当内容开始返回时调用",__func__);
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    PPLog(@" %s 页面加载完成之后调用",__func__);
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    PPLog(@" %s 页面加载失败时调用",__func__);
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    PPLog(@" %s 接收到服务器跳转请求之后调用",__func__);
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    PPLog(@" %s 在收到响应后，决定是否跳转",__func__);
    NSLog(@"navigationResponse.response.URL.absoluteString -- %@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    PPLog(@" %s 在发送请求之前，决定是否跳转",__func__);
    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
#pragma mark - WKUIDelegate
// 创建一个新的WebView
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    return [[WKWebView alloc]init];
}
// 输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    completionHandler(@"http");
}
// 确认框
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    completionHandler(YES);
}
// 警告框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"%@",message);
    completionHandler();
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
