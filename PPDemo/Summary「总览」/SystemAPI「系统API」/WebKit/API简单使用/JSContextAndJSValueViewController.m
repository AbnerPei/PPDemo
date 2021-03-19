//
//  JSContextAndJSValueViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/19.
//

#import "JSContextAndJSValueViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

/*
 * 参考链接：
 * [iOS与JS交互实战篇（ObjC版）](https://mp.weixin.qq.com/s?__biz=MzIzMzA4NjA5Mw==&mid=214063688&idx=1&sn=903258ec2d3ae431b4d9ee55cb59ed89#rd)
 * 
 */

@interface JSContextAndJSValueViewController ()

@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation JSContextAndJSValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self test01];
    [self test02];
    

}

- (void)test01
{
    // 一个JSContext对象，就类似于Js中的window，
    // 只需要创建一次即可。
    self.jsContext = [[JSContext alloc] init];
    
    //  jscontext可以直接执行JS代码。
    [self.jsContext evaluateScript:@"var num = 10"];
    [self.jsContext evaluateScript:@"var squareFunc = function(value) { return value * 2 }"];
    // 计算正方形的面积
    JSValue *square = [self.jsContext evaluateScript:@"squareFunc(num)"];
    
    // 也可以通过下标的方式获取到方法
    JSValue *squareFunc = self.jsContext[@"squareFunc"];
    JSValue *value = [squareFunc callWithArguments:@[@"20"]];
    NSLog(@"%@", square.toNumber);
    NSLog(@"%@", value.toNumber);
}

- (void)test02
{
    JSContext *context = [[JSContext alloc] init];
    context[@"log"] = ^() {
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        JSValue *this = [JSContext currentThis];
        NSLog(@"this: %@",this);
        NSLog(@"-------End Log-------");
    };
    [context evaluateScript:@"log('ider', [7, 21], { hello:'world', js:100 });"];
    //
    // Output:
    // +++++++Begin Log+++++++
    // ider
    // 7,21
    // [object Object]
    // this: [object GlobalObject]
    // -------End Log-------
}



@end
