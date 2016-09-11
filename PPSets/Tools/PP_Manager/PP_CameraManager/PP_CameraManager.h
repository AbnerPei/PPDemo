//
//  PP_CameraManager.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PP_CameraManager : NSObject

+(PP_CameraManager *)pp_shareInstance;

/*!判断系统相机是否可用 */
-(BOOL)pp_isCameraAvailable;

/*!判断系统相机【前置闪光灯】是否可用 */
-(BOOL)pp_isCameraFrontFlashAvailable;

/*!判断系统相机【后置闪光灯】是否可用 */
-(BOOL)pp_isCameraRearFlashAvailable;

/*!判断系统相机【前置摄像头】是否可用 */
-(BOOL)pp_isCameraFrontAvailable;

/*!判断系统相机【后置摄像头】是否可用*/
-(BOOL)pp_isCameraRearAvailable;

/*!
 *  当前camera支持的媒体类型 ： image or video
  if ([self isCameraSupportMedia:(__bridge NSString *)kUTTypeVideo]) {
 <#statements#>
 }
 */
-(BOOL)isCameraSupportMedia:(NSString *)mediaType;

@end
