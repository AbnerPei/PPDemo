//
//  RuntimeViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/1.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
#import "User.h"
#import "Student.h"
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *recommenderLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 40)];
    recommenderLB.text = @"详情请看控制台打印";
    recommenderLB.textColor = [UIColor redColor];
    recommenderLB.font = [UIFont boldSystemFontOfSize:20];
    recommenderLB.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:recommenderLB];
    [self startLBAnimation:recommenderLB];
    

    
    User *user = [[User alloc]init];
    
    //获取给定对象的类名字符串
    const char* ppName;
    ppName = object_getClassName(user);
    NSLog(@"ppName is ---- %s",ppName);
    //2016-08-02 17:55:25.908 PPDemos[18127:506759] ppName is ---- User

}
#pragma mark --- 判断一些东东
-(void)judgeSth
{
    //获取一个对象的类名
    User *user = [[User alloc]init];
    Class class = object_getClass(user);
    NSString *classStr = NSStringFromClass(class);
    NSLog(@"user是【--%@--】类",classStr);
    //2016-08-02 16:58:48.740 PPDemos[17388:476098] user是【--User--】类
    
    
    //将一个对象设置为别的类类型，返回原来的Class
    User * user1 = [[User alloc] init];
    NSLog(@"user1（前） - %@", [user1 class]);
    Class stu = object_setClass(user1, [Student class]);
    NSLog(@"stu - %@", [stu class]);
    NSLog(@"user1（后） - %@", [user1 class]);
    //2016-08-02 17:32:17.635 PPDemos[17816:494245] user1（前） - User
    //2016-08-02 17:32:17.641 PPDemos[17816:494245] stu - User
    //2016-08-02 17:32:17.641 PPDemos[17816:494245] user1（后） - Student
    
    
    //判断是否是一个不为空的类对象
    BOOL isUser = object_isClass([user class]);
    NSLog(@"是不是一个类对象1--%d",isUser);
    NSString *ppStr = @"ppdemos";
    BOOL isStr = object_isClass([ppStr class]);
    NSLog(@"是不是一个类对象2--%d",isStr);
    User *ppUser;
    BOOL isPPUser = object_isClass([ppUser class]);
    NSLog(@"是不是一个类对象3--%d",isPPUser);
    //2016-08-02 17:49:29.115 PPDemos[18039:503037] 是不是一个类对象1--1
    //2016-08-02 17:49:29.115 PPDemos[18039:503037] 是不是一个类对象2--1
    //2016-08-02 17:49:29.115 PPDemos[18039:503037] 是不是一个类对象3--0
}
/**
 *  交换两个方法的实现
 */
-(void)changeMethod
{
    //交换类方法
    Method read = class_getClassMethod([User class], @selector(pp_read));
    Method jump = class_getClassMethod([User class], @selector(pp_jump));
    method_exchangeImplementations(read, jump);
    [User pp_read];
    [User pp_jump];
    
    //交换实例方法
    Method eat = class_getInstanceMethod([User class], @selector(user_eat));
    Method sleep = class_getInstanceMethod([User class], @selector(user_sleep));
    method_exchangeImplementations(eat, sleep);
    User *user = [[User alloc]init];
    [user user_eat];
    [user user_sleep];
    /*
     //打印结果
     2016-08-02 15:57:21.154 PPDemos[16698:444839] runtime-pp_jump-->去跳舞《抓钱舞》
     2016-08-02 15:57:21.155 PPDemos[16698:444839] runtime-pp_read-->我在读古典的书《拆掉思维里的墙：原来我还可以这样活》
     2016-08-02 15:57:21.155 PPDemos[16698:444839] runtime-sleep-->中午不睡，下午作废。
     2016-08-02 15:57:21.156 PPDemos[16698:444839] runtime-eat-->人如果吃不好,就不能好好思考,好好爱,好好休息。
     */
    
}
#pragma mark --- 利用runtime获取XX列表
-(void)getXXLists
{
    //runtime获取模型的【属性】列表
    unsigned int count;
    //获得指向该类（User类）所有属性的指针
    objc_property_t *propertyLists = class_copyPropertyList([User class], &count);
    for (unsigned int i=0; i<count; i++) {
        //根据objc_property_t获取其属性的名称------->C语言的字符串
        const char *propertyName = property_getName(propertyLists[i]);
        NSString *nameStr = [NSString stringWithUTF8String:propertyName];
        NSLog(@"runtime获取模型属性列表---%@\n",nameStr);
    }
    
    //runtime获取模型的【方法】列表
    Method *methodLists = class_copyMethodList([User class], &count);
    for (unsigned int i=0; i<count; i++) {
        Method aMethod = methodLists[i];
        NSString *methodStr = NSStringFromSelector(method_getName(aMethod));
        NSLog(@"runtime获取模型的【方法】列表---%@\n",methodStr);
        //.cxx_destruct介绍 阳神的博客
    }
    
    
    //runtime获取成员变量列表
    Ivar *ivarLists = class_copyIvarList([User class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarLists[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"runtime获取成员变量列表---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //runtime获取协议列表
    __unsafe_unretained Protocol **protocolLists = class_copyProtocolList([User class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolLists[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"runtime获取协议列表---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)startLBAnimation:(UILabel *)lb
{
    //1, 创建核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    
    //2, 告诉系统执行什么动画。
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.values = @[@(-M_PI_4 /90.0 * 5),@(M_PI_4 /90.0 * 5),@(-M_PI_4 /90.0 * 5)];
    
    //  3, 执行完之后不删除动画
    keyAnima.removedOnCompletion = NO;
    
    // 4, 执行完之后保存最新的状态
    keyAnima.fillMode = kCAFillModeForwards;
    
    // 5, 动画执行时间
    keyAnima.duration = 0.2;
    
    // 6, 设置重复次数。
    keyAnima.repeatCount = MAXFLOAT;
    
    // 7, 添加核心动画
    [lb.layer addAnimation:keyAnima forKey:nil];
}
@end
