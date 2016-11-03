//
//  AnimationShowViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/29.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AnimationShowViewController.h"

@interface AnimationShowViewController ()

@end

@implementation AnimationShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    SEL sel = NSSelectorFromString(self.selName);

//    [self performSelector:sel withObject:nil];
    
    [self shadowAndBorder];
  
#warning pptest
    
    PPWeakSelf(self);
    [UIView animateWithDuration:1.4 animations:^{
        PPStrongSelf(self);
        self.view.backgroundColor = [UIColor pp_cyanColor];
    }];
    
    /*     //=========
     
     Multithreading 多线程
     unresponsive 无反应的
     
     hence adv. 因此 英  [hens]   美  [hɛns]
     assumes vt. 假定 英  [ə'sjuːm]   美  [ə'sum]
     ado n. 忙乱，纷扰，麻烦 英  [ə'duː]   美  [ə'du]
     swig n. 痛饮，大喝 英  [swɪg]   美  [swɪɡ]
     soda n. 苏打；碳酸水 英  ['səʊdə]   美  ['sodə]
     chew vt. 嚼碎，咀嚼  英  [tʃuː]   美  [tʃʊ]
     bubble gum 泡泡糖
     
     puppet n. 木偶；傀儡；受他人操纵的人 英  ['pʌpɪt]   美  ['pʌpɪt]
     skeptical adj. 怀疑的；不可知论的 英  ['skeptɪkəl]   美  ['skɛptɪkl]
     pause  停顿
     
     retrieve vt. [计] 检索 英  [rɪ'triːv]   美  [rɪ'triv]
     forum n. 论坛 英  ['fɔːrəm]   美  ['fɔrəm]
     significant adj. 重大的；有效的；有意义的 英  [sɪg'nɪfɪk(ə)nt]   美  [sɪɡ'nɪfɪkənt]
     consequences n. 后果，结果 英  ['kɑnsə,kwɛnsɪz]   美  ['kɑnsə,kwɛnsɪz]
     dire adj. 可怕的；悲惨的；极端的 英  ['daɪə]   美  ['daiə]
     subscribe vi. 订阅 英  [səb'skraɪb]   美  [səb'skraɪb]
     terminate vt. 使终止；使结束 ['tɜːmɪneɪt]   美  ['tɝmɪnet]
     rescue vt. 营救；援救 英  ['reskjuː]   美  ['rɛskju]
     
     dreaded adj. 令人畏惧的，可怕的 英  ['dredɪd]   美  ['drɛdɪd]
     halt vt. 使停止 英  [hɔːlt]   美  [hɔlt]
     
     //编译项目错误及解决办法
     
     > Unsupported compiler 'com.apple.compilers.llvmgcc42' selected for architecture 'i386'
     [解决办法](http://blog.csdn.net/qq_29284809/article/details/50237887)
     
     > Undefined symbols for architecture x86_64:
     "_crc32", referenced from:
     [解决办法](http://www.mamicode.com/info-detail-453970.html)

     3. 你之所以选择不了模拟器或者设备，是因为你工程中的iOS Deployment Target设置不对。比如你装的是xcode4.0.1，并且安装了SDK5.0，那么如果你设置了iOS Deployment Target为5.0的话，就会出现你的这个问题了。因为你当前的xcode版本没有能运行sdk5.0的模拟器。所以在工程树中单击你的工程名，就会出现工程设置页面，选择Info下的Deployment Target并把iOS Deployment Target设置为比你模拟器版本更低的值即可。或者你选择模拟器，在最下边有一个选择“More Simulators”，再弹出窗口安装你当前工程可用的Simulator。
     */
    
    
}
-(void)shadowAndBorder
{
    UIView *viewSample = [[UIView alloc] init];
    [self.view addSubview:viewSample];
    
    viewSample.backgroundColor = [UIColor greenColor];
    viewSample.frame = CGRectMake(100, 100, 100, 100);
    
    
    //Test 1 阴影
    //viewSample.layer.shadowPath = [UIBezierPath bezierPathWithRect:viewSample.bounds].CGPath;
    viewSample.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)].CGPath;
    viewSample.layer.masksToBounds = NO;
    viewSample.layer.shadowOffset = CGSizeMake(10, 10);
    viewSample.layer.shadowRadius = 5;
    viewSample.layer.shadowOpacity = 0.5;
    
    //Test 2 边框
    viewSample.layer.borderWidth = 2;
    viewSample.layer.borderColor = [[UIColor redColor] CGColor];
}
- (void)transformAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"transform.rotation";//转圈
    //    anim.keyPath = @"transform.scale.x";//平铺扩充
    //    anim.keyPath = @"transform.translation.y";//平移
#warning 以下两个效果一样，都是包装成对象类型
    anim.toValue = @(100);
    
    // anim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anim.duration = 2.0;
    
    
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.view.layer addAnimation:anim forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
