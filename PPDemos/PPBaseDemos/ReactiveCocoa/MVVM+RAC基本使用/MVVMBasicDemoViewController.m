//
//  MVVMBasicDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "MVVMBasicDemoViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "LoginViewModel.h"

@interface MVVMBasicDemoViewController ()
/** <#注释#>  */
@property(nonatomic,strong)UITextField *nameTF;
/** <#注释#>  */
@property(nonatomic,strong)UITextField *passwordTF;
/** <#注释#>  */
@property(nonatomic,strong)UIButton *loginBT;
/** <#注释#>  */
@property(nonatomic,strong)LoginViewModel *loginViewM;
@end

@implementation MVVMBasicDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.nameTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.loginBT];
    
    //给VM设置值
    RAC(self.loginViewM, name) = self.nameTF.rac_textSignal;
    RAC(self.loginViewM, password) = self.passwordTF.rac_textSignal;
    //处理登录按钮是否可点击
    RAC(_loginBT,enabled) = self.loginViewM.loginBTEnableSignal;;
    

    //监听按钮点击事件
    [[_loginBT rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"按钮点击 ---  %@",x);
        //处理登录事件
        [self.loginViewM.loginCommand execute:nil];
    }];
    
    
}


-(LoginViewModel *)loginViewM
{
    if (!_loginViewM) {
        _loginViewM = [[LoginViewModel alloc]init];
    }
    return _loginViewM;
}


-(UITextField *)nameTF
{
    if (!_nameTF) {
        _nameTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 80, ScreenWidth-20, 40)];
        _nameTF.placeholder = @"名字";
        _nameTF.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _nameTF;
}
-(UITextField *)passwordTF
{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 80+60, ScreenWidth-20, 40)];
        _passwordTF.placeholder = @"密码";
        _passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _passwordTF;
}

-(UIButton *)loginBT
{
    if (!_loginBT) {
        _loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBT setTitle:@"login" forState:(UIControlStateNormal)];
        _loginBT.frame = CGRectMake(40, 200, ScreenWidth-80, 45);
        [_loginBT setTitleColor:[UIColor pp_blueColor] forState:UIControlStateNormal];
    }
    return _loginBT;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
