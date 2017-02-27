//
//  JRAccessPermissionsTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/20.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "JRAccessPermissionsTool.h"
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import "JRDeviceTool.h"

#define JRIOS(version)     ([[[UIDevice currentDevice] systemVersion] floatValue] >= version ? YES : NO)

@interface JRAccessPermissionsTool ()<UIAlertViewDelegate>

@end

@implementation JRAccessPermissionsTool


+(JRAccessPermissionsTool *)jr_accessPermissionsShareInstance
{
    static JRAccessPermissionsTool *tool = nil;
    static dispatch_once_t onceTool;
    dispatch_once(&onceTool, ^{
        tool = [[JRAccessPermissionsTool alloc]init];
    });
    return tool;
}

-(void)jr_pushToSystemSetting
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

//////////////////////////// 位置 //////////////////////////////

-(void)jr_locationMasterOffRecommend
{
    NSString *message = [NSString stringWithFormat:@"请打开[设置]-[隐私]-[定位服务]，打开开关，然后在下面列表点击【%@】，选择【使用应用期间】或者【始终】！",[JRDeviceTool jr_getAppName]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
-(BOOL)jr_hasMasterLocationServiceOn
{
    BOOL serviceEnable = [CLLocationManager locationServicesEnabled];
    return serviceEnable;
}
-(JRAccessPermission)jr_hasLocationAccessPermission
{
    BOOL hasLocation = [self jr_hasMasterLocationServiceOn];
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if (hasLocation) {
        switch (authorizationStatus) {
            case kCLAuthorizationStatusAuthorizedAlways:              //一直允许获取定位
            case kCLAuthorizationStatusAuthorizedWhenInUse:           //在使用时允许获取定位
            case kCLAuthorizationStatusNotDetermined:                 //用户尚未对该应用程序作出选择
            {
                return JRAccessPermissionYes;
            }
                break;
            case kCLAuthorizationStatusDenied:                        //拒绝获取定位
            case kCLAuthorizationStatusRestricted:                    //应用程序的定位权限被限制
            {
                return JRAccessPermissionNo;
            }
                break;
                
            default:
                break;
        }
    }else{
        //系统总开关已关闭
        return JRAccessPermissionMasterOff;
    }
}

//////////////////////////// 通讯录 //////////////////////////////

-(void)jr_hasContactAccessPermissionWithContactBlock:(JRJRAccessPermissionContactBlock)contactBlock andUserDeterminedBlock:(JRJRAccessPermissionContactUserDeterminedBlock)userDeterminedBlock
{
    if (JRIOS(9.0)) {
        //1、获取授权状态
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        //2、判断是否还没决定
        switch (status) {
            case CNAuthorizationStatusNotDetermined:
            {
                //2.1 实时监控用户点击【不允许】还是【允许】
                CNContactStore *contactStore = [[CNContactStore alloc] init];
                [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError *_Nullable error) {
                    //2.2 回到主线程回调
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (granted) {
                            userDeterminedBlock(YES);
                        }else{
                            userDeterminedBlock(NO);
                        }
                    });
                }];
            }
                break;
                
            case CNAuthorizationStatusAuthorized:
            {
                contactBlock(YES);
            }
                break;
            case CNAuthorizationStatusRestricted:
            case CNAuthorizationStatusDenied:
            {
                contactBlock(NO);
            }
                break;
                
            default:
                break;
        }
    }else{
        //ios 9 以前
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        ABAuthorizationStatus authStatus = ABAddressBookGetAuthorizationStatus();
        switch (authStatus) {
            case kABAuthorizationStatusNotDetermined:
            {
                ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (granted) {
                            userDeterminedBlock(YES);
                        }else{
                            userDeterminedBlock(NO);
                        }
                    });
                });
            }
                break;
                
            case kABAuthorizationStatusRestricted:
            case kABAuthorizationStatusDenied:
            {
                contactBlock(NO);
            }
                break;
                
            case kABAuthorizationStatusAuthorized:
            {
                contactBlock(YES);
            }
                break;
                
            default:
                break;
        }
       
    }
}

-(void)jr_contactNotAccessRecommend
{
    NSString *message = [NSString stringWithFormat:@"%@无法访问你的通讯录，手动选择请在系统设置-隐私-通讯录里允许%@访问",[JRDeviceTool jr_getAppName],[JRDeviceTool jr_getAppName]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"手动前往" otherButtonTitles:@"立即前往", nil];
    alert.delegate = self;
    alert.tag = 6057;
    [alert show];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 6057 && buttonIndex == 1) {  //通讯录
        [self jr_pushToSystemSetting];
    }
}
@end
