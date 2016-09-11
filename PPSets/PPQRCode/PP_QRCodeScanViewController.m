//
//  PP_QRCodeScanViewController.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/22.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import "PP_QRCodeScanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PP_QRCodeBgView.h"
#import "PP_QRCodeScanView.h"
#import "UIView+PP_Frame.h"
#import <MobileCoreServices/MobileCoreServices.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface PP_QRCodeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    PP_QRCodeScanView *_areaView;//扫描区域视图
    NSString *resultCodeStr;//添加商品界面用的扫描结果
}
@end

@implementation PP_QRCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    /**
     *  初始化二维码扫描
     */
    
    if ([self isCammer]) {
        //扫描区域
        CGRect areaRect = CGRectMake((ScreenWidth - 218)/2, (ScreenHeight - 218)/2, 218, 218);
        
        //半透明背景
        PP_QRCodeBgView *bacgrouView = [[PP_QRCodeBgView alloc]initWithFrame:self.view.bounds];
        bacgrouView.scanFrame = areaRect;
        [self.view addSubview:bacgrouView];
        
        //设置扫描区域
        _areaView = [[PP_QRCodeScanView alloc]initWithFrame:areaRect];
        [self.view addSubview:_areaView];
        
        resultCodeStr = @"";
        
        //提示文字
        UILabel *label = [UILabel new];
        label.text = @"将二维码放入框内，即开始扫描";
        label.textColor = [UIColor whiteColor];
        label.top = CGRectGetMaxY(_areaView.frame) + 20;
        [label sizeToFit];
        label.center = CGPointMake(_areaView.center.x, label.center.y);
        [self.view addSubview:label];
        
        //返回键
        UIButton *backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        backbutton.frame = CGRectMake(12, 26, 42, 42);
        [backbutton setBackgroundImage:[UIImage imageNamed:@"prev"] forState:UIControlStateNormal];
        [backbutton addTarget:self action:@selector(backbuttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backbutton];

        //获取摄像设备
        AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        //创建输入流
        AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        //创建输出流
        AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
        
        //设置代理 在主线程里刷新
        [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        //设置识别区域
        output.rectOfInterest = CGRectMake(_areaView.top/ScreenHeight, _areaView.left/ScreenWidth, _areaView.height/ScreenHeight, _areaView.width/ScreenWidth);
        
        //初始化链接对象
        session = [[AVCaptureSession alloc]init];
        //高质量采集率
        [session setSessionPreset:AVCaptureSessionPresetHigh];
        
        if ([session canAddInput:input]) {
            [session addInput:input];
        }
        if ([session canAddOutput:output]) {
            [session addOutput:output];
        }
        
        
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        output.metadataObjectTypes=@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
        
        AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
        layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
        layer.frame=self.view.layer.bounds;
        
        [self.view.layer insertSublayer:layer atIndex:0];
        
        //开始捕获
        [session startRunning];
    }else{
        //返回键
        UIButton *backbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        backbutton.frame = CGRectMake(12, 26, 42, 42);
        [backbutton setBackgroundImage:[UIImage imageNamed:@"prev"] forState:UIControlStateNormal];
        [backbutton addTarget:self action:@selector(backbuttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backbutton];

        [self noCameraReminder];
    }
   
}
#pragma 二维码扫描的回调
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [session stopRunning];//停止扫描
        [_areaView pp_stopAnimaion];//暂停动画
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        
        //输出扫描字符串
        NSLog(@"%@",metadataObject.stringValue);
       
        [self.delegate pp_QRCodeDidScanWithResultStr:metadataObject.stringValue];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
#pragma mark --- "返回"按钮点击事件
-(void)backbuttonClicked
{
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //下面的可根据情况设置
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
   
}
-(BOOL)isCammer
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        
        NSLog(@"相机权限受限");
        return NO;
    }else{
        NSLog(@"相机可以使用");
        return YES;
    }
}
#pragma mark --- 没有调用相机的权限提示
-(void)noCameraReminder
{
    UIAlertView *alert;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                           message:@"如果你想继续使用相机，请在iPhone的“设置”-“隐私”-“相机”中，找到懒猫社长商家版允许"
                                          delegate:nil
                                 cancelButtonTitle:@"确定"
                                 otherButtonTitles:nil, nil];
    } else {
        alert = [[UIAlertView alloc]initWithTitle:@"您没有访问相机权限" message:@"如果你想继续使用相机，请在iPhone的“设置”-“隐私”-“照片”中，找到懒猫社长商家版允许" delegate:self cancelButtonTitle:@"不允许" otherButtonTitles:@"前往", nil];
        alert.tag = 6057;
        [alert show];
        
    }
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        case 6057:  //没有调用相机的权限处理
            if (buttonIndex == 1) {
                [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
            }
            break;
        default:
            break;
    }
}


@end
