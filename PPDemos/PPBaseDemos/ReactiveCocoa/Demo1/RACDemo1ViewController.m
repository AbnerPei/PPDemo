//
//  RACDemo1ViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//  否则你连谈话的资格都没有。

#import "RACDemo1ViewController.h"
#import "PPRedView.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>
#import "PersonBlock.h"

@interface RACDemo1ViewController ()
/** <#注释#>  */
@property(nonatomic,strong)PPRedView *redView;
/** <#注释#>  */
@property(nonatomic,strong)UIButton *btn;
/** <#注释#>  */
@property(nonatomic,strong)UITextField *textField;


@end

@implementation RACDemo1ViewController
-(void)personBlockTest
{
    PersonBlock *person = [[PersonBlock alloc]init];
    person.run(100).run(50);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    //一些基础的测试
//    [self racBaseTest];
    
    [self singalTest];
    
 
    //1. 创建信号
    RACSubject *subject = [RACSubject subject];
    
    //2.订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"subject 收到信号 %@",x);
    }];
    
    //3.发送数据
    [subject sendNext:@45];
    
    
    
}

-(void)singalTest
{
    //RACSignal  信号类    创建信号
    //RACSubscriber是协议  发送信号
    //RACSubject :        既能创建信号，也能发送信号
    
    
    //1.创建信号（冷信号）
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"信号来了");
        //3.发送信号
        [subscriber sendNext:@89];
        
        //4.取消信号
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"取消信号订阅了");
        }];
    }];
    
    //2.订阅信号（热信号）
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"信号发送的内容：%@",x);
    }];
}
-(void)racBaseTest
{
    [self personBlockTest];
    
    PPRedView *redV = [[PPRedView alloc]initWithFrame:CGRectMake(50, 150, ScreenWidth-100, 200)];
    [self.view addSubview:redV];
    _redView = redV;
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setTitle:@"rac实现btn点击事件监听" forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    _btn.frame = CGRectMake(0, ScreenHeight-50, ScreenWidth, 50);
    _btn.backgroundColor = [UIColor pp_tawnyColor];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, ScreenWidth-40, 50)];
    _textField.placeholder = @"RAC实现tf代理做的事情";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_textField];
    
    
    //利用RAC来做响应
    [[_redView rac_signalForSelector:@selector(ButtonClicked)] subscribeNext:^(RACTuple * _Nullable x) {
        PPLog(@"控制器知道了呀");
    }];
    
    //    //用RAC实现kVO (导入#import <ReactiveObjC/NSObject+RACKVOWrapper.h>的方法)
    //    [_redView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
    //        NSLog(@"dict change is %@\n causedByDealloc is %d\n affected",change,causedByDealloc,affectedOnlyLastComponent);
    //    }];
    
    //用RAC 信号 实现KVO 【在第一次alloc时设置frame就会回调】
    [[_redView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"rac 信号 %@",x);
    }];
    
    //RAC监听btn点击事件
    [[_btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"监听btn点击事件 %@",x);
    }];
    
    
    //通知用RAC替代
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil]subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@" 监听键盘弹出 %@",x);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _redView.frame = CGRectMake(50, 200, 200, 20);
}



@end
