//
//  JSViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/24.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "JSViewController.h"
#import "Person.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface JSViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@property(nonatomic,strong)JSContext *jsContext;

@end

@implementation JSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.jsContext = [[JSContext alloc]init];
//    [self useJSExprot];
    
//    [self creatWebView];
    
    [self oc2js];
    
}
-(void)oc2js
{
    
}
-(void)creatWebView{
    //初始化webview
    myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    myWebView.delegate=self;
    //添加webview到当前viewcontroller的view上
    [self.view addSubview:myWebView];
    
    //网址
    NSString *httpStr=@"https://www.baidu.com";
    NSURL *httpUrl=[NSURL URLWithString:httpStr];
    NSURLRequest *httpRequest=[NSURLRequest requestWithURL:httpUrl];
    [myWebView loadRequest:httpRequest];
}
#pragma mark --- 通过oc方法调用js的alert
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    //网页加载完成调用此方法
//    
//    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('test js OC')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert
//    
//}
#pragma mark --- iOS调用js
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //网页加载完成调用此方法
    
    //iOS调用js
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //js调用iOS
    //第一种情况
    //其中test1就是js的方法名称，赋给是一个block 里面是iOS代码
    //此方法最终将打印出所有接收到的参数，js参数是不固定的 我们测试一下就知道
    context[@"test1"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) {
            NSLog(@"%@",obj);
        }
    };
    //此处我们没有写后台（但是前面我们已经知道iOS是可以调用js的，我们模拟一下）
    //首先准备一下js代码，来调用js的函数test1 然后执行
    //一个参数
    NSString *jsFunctStr=@"test1('参数1')";
    [context evaluateScript:jsFunctStr];
    
    //二个参数
    NSString *jsFunctStr1=@"test1('参数a','参数b','参数c','参数d')";
    [context evaluateScript:jsFunctStr1];
    
    
    /*
     打印结果：
     2016-06-24 19:06:21.929 PPDemos[17674:473124] 参数1
     2016-06-24 19:06:35.377 PPDemos[17674:473124] 参数a
     2016-06-24 19:06:37.610 PPDemos[17674:473124] 参数b
     2016-06-24 19:06:39.273 PPDemos[17674:473124] 参数c
     2016-06-24 19:06:48.625 PPDemos[17674:473124] 参数d
     
     */
    
}
- (void)useJSExprot {
    /*
     参考：http://liuyanwei.jumppo.com/2016/04/03/iOS-JavaScriptCore.html
     @note：JSExport对象的用法(导入头文件#import <JavaScriptCore/JavaScriptCore.h>
)
     1: 首先自定义个协议继承自JSExprot，并定义需要暴露给js的属性和方法
     2: 新建一个native对象(Person)，实现协议和方法
     3: 调用- (void)useJSExprot
    */
    Person *p = [[Person alloc]init];
    self.jsContext[@"person"] = p;
    JSValue *value = [self.jsContext evaluateScript:@"person.whatYouName()"];
    NSLog(@"JSValue----%@",value);
    
    //运行结果
    //2016-06-24 18:23:22.203 PPDemos[17391:456200] JSValue----my name is liuyanwei
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
