//
//  RequestUrl.h
//  MJDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h

//百思姐图片
#define MissBaisiImageUrl @"http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=%@&page=%d&per=20&type=10"


#endif /* RequestUrl_h */

/*
 2016.8.8 --- 2016.8.9 [9号上午开会多]
 
登录（LoginViewController）：
注册（RegisterViewController）：
验证码登录（SMSViewController）：
 
 【业务逻辑说明】
   1. 登录界面一律是present出来，之后上面的“注册”，“忘记密码”，“手机验证码登录”全部是push;
   2. 此版本新增，所有输入框没有输入时，对应的“登录”，“注册”等按钮显示0xcccccc色调，全部输入了才显示主题色；
   3. 获取验证码后，开始倒计时（45秒，44秒，43秒...）然后“重新发送”；
   4. 界面的布局（严格按照新版UI执行）
   5. 删除之前版本对应VC用的Xib；
   6. 整理这几个界面的项目代码，同样的代码能封装进行相应的简单封装，减少代码量；同时优化项目的属性或者控件命名，从最初的aa,bb,cc,到如今的btn1,btn2等等；简直了！【自己也是有个体会，不求别人以后看自己的代码不骂自己，起码咱规范点，让人家少骂几句，嘿嘿】
 
 【之前存在的问题】
   1. 登录界面只是一个普通的VC，并没有用NavVC包装，导致相应push无法进行；而全局搜索`LoginViewController *login = [[LoginViewController alloc] init];`又会发现好多地方用到，有点违背最初的APPData类的管理功能；但为了保守及安全，暂时不全修改，只在确定的地方修改；
   2. 验证码倒计时的逻辑错误，应该是点击获取验证码后就立即执行；而不是等到获取验证码网络请求结果才执行；
   3. xib文件多，命名不规范，代码冗余多，重复多；
 
*/