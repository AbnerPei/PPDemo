//
//  PP_CameraManager.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//
/*!
 * @author ╰莪呮想好好宠Nǐつ, 16-05-29 19:05:35
 *
 * iOS开发中关于手机相机权限的管理类
 */

#import "PP_CameraManager.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation PP_CameraManager

+(PP_CameraManager *)pp_shareInstance
{
    static PP_CameraManager *aCameraManage = nil;
    static dispatch_once_t onceArrayManager;
    dispatch_once(&onceArrayManager, ^{
        aCameraManage = [[PP_CameraManager alloc]init];
    });
    return aCameraManage;
}
/*!
 *  判断系统相机是否可用
 *  @return YES or No,YES代表可以用，NO代表不可以用！
 */
-(BOOL)pp_isCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

/*!
 *  判断系统相机【前置闪光灯】是否可用
 *  @return YES or No,YES代表可以用，NO代表不可以用！
 */
-(BOOL)pp_isCameraFrontFlashAvailable
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
}
/*!
 *  判断系统相机【后置闪光灯】是否可用
 *  @return YES or No,YES代表可以用，NO代表不可以用！
 */
-(BOOL)pp_isCameraRearFlashAvailable
{
    return [UIImagePickerController isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
}

/*!
 *  判断系统相机【前置摄像头】是否可用
 *  @return YES or No,YES代表可以用，NO代表不可以用！
 */
-(BOOL)pp_isCameraFrontAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
/*!
 *  判断系统相机【后置摄像头】是否可用
 *  @return YES or No,YES代表可以用，NO代表不可以用！
 */
-(BOOL)pp_isCameraRearAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

/*!
 *  当前camera支持的媒体类型 ： image or video
 *  @param mediaType kUTTypeImage
 *  @return @return YES or No,YES代是，NO代表不是！
 
 if ([self isCameraSupportMedia:(__bridge NSString *)kUTTypeVideo]) {
 <#statements#>
 }
 */
-(BOOL)isCameraSupportMedia:(NSString *)mediaType
{
    NSArray *availableMedias = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    for (NSString *aMediaType in availableMedias) {
        if ([aMediaType isEqualToString:mediaType]) {
            return YES;
        }
    }
    return NO;
}

@end
