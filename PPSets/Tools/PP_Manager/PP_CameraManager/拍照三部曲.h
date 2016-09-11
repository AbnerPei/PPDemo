//
//  拍照三部曲.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef ______h
#define ______h

记得导入头文件：
#import <MobileCoreServices/MobileCoreServices.h>
#import "PP_CameraManager.h"

第0步：最严谨的还是先检测当前相机是否可用
第一步：配置UIImagePickerController【包括设置属性】
第二步：回调方法【如何拿到图片：代理方法中的info】
第三步：cancel 【取消后，dismiss pickerController】


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.检测相机可用不
    BOOL canUseCamera = [[PP_CameraManager pp_shareInstance]pp_isCameraAvailable];
    
    if(canUseCamera){
        //2.配置UIImagePickerController
        [self configImagePickerController];

    }
    
    
}
-(void)configImagePickerController
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    //设置sourceType
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    //设置代理，记得遵守UIImagePickerControllerDelegate
    pickerController.delegate = self;
    //是否可编辑拍照后的照片(默认NO)
    pickerController.allowsEditing = NO;
    //设置相机支持类型是拍照
    NSString *mediaType = (__bridge NSString *)kUTTypeImage;
    pickerController.mediaTypes = [NSArray arrayWithObjects:mediaType, nil];
    //设置拍照时闪光灯状态
    pickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
    //present pickerController
    [self.navigationController presentViewController:pickerController animated:YES completion:nil];
    
    
}

/*
 info里面的信息：1.媒体类型（拍照，录像）
 2.照片
 3.媒体附加信息（拍照时间，拍照的该手机的型号等等）
 */
#pragma mark ---UIImagePickerControllerDelegate的【拍照成功回调】
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //定义外部变量originalImage，存储拍照的照片，方便外部使用
    UIImage *originalImage;
    //也可以这样判断【if (CFStringCompare((CFStringRef) mediaType,kUTTypeImage, 0)== kCFCompareEqualTo) 】，我自己暂时还看不懂
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        //把拍的照片存入系统相册（无论你使用或者取消，只要拍了就存）
        SEL saveImage = @selector(savedImage:didFinishSavingWithError:contextInfo:);
        UIImageWriteToSavedPhotosAlbum(originalImage, self, saveImage, nil);
        
    }
}
#pragma mark --- UIImageWriteToSavedPhotosAlbum里面的SEL参数（系统说了，如果设置should have the form:     //  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;）
-(void)savedImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil) { //照片保存成功
        //do something
        
    }else{ //照片保存失败（我看到这个，在此记录是因为自己在保存视频的时候系统提示我内存空间不足，那如果内存不足，是不是保存这图片也会给提示？？？暂留着，故记录）
        NSLog(@"zhaop保存失败%@",error);
    }
}
#pragma mark ---UIImagePickerControllerDelegate的【点击左下角的“取消”回调】
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



#endif /* ______h */
