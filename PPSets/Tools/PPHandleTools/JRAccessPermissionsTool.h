//
//  JRAccessPermissionsTool.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/20.
//  Copyright © 2017年 Guda wei. All rights reserved.
//
typedef NS_ENUM(NSInteger,JRAccessPermission){
    JRAccessPermissionMasterOff = 0,           //系统总开关（定位服务开关，关闭则所有的都不可以用）
    JRAccessPermissionYes,                     //可以访问
    JRAccessPermissionNo                       //不能访问
};

/**
 通讯录
  1、用户是否授权
  2、用户还没有决定，但是又要决定【不允许】或者【允许】
 */
typedef void(^JRJRAccessPermissionContactBlock)(BOOL hasAuthorize);
typedef void(^JRJRAccessPermissionContactUserDeterminedBlock)(BOOL isAllow);

#import <Foundation/Foundation.h>

#define JRAccessPermissionsTools  [JRAccessPermissionsTool jr_accessPermissionsShareInstance]


/**
 iOS各种"访问权限"判断工具
 */
@interface JRAccessPermissionsTool : NSObject

+(JRAccessPermissionsTool *)jr_accessPermissionsShareInstance;


/**
 跳转到设置界面，修改权限
 */
-(void)jr_pushToSystemSetting;

/////////////////////////////////001 位置/////////////////////////////////
/**
 【定位服务】关闭时的提示
 */
-(void)jr_locationMasterOffRecommend;

/**
 系统的【定位服务】是否打开，只有系统的定位服务打开，所有APP才能使用定位功能！！！
 */
-(BOOL)jr_hasMasterLocationServiceOn;

/**
 是否有访问【位置】的权限
【实时监控状态，请在下面的代理方法中执行操作！！】
 - (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
 */
-(JRAccessPermission)jr_hasLocationAccessPermission;

/////////////////////////////////002 通讯录/////////////////////////////////
/**
 是否有访问【通讯录】的权限   【通讯录选取后，APP会回到首页，测试几个APP都这样】

 @param contactBlock 用户是否授权
 @param userDeterminedBlock 用户还没有决定，但是又要决定【不允许】或者【允许】
 */
-(void)jr_hasContactAccessPermissionWithContactBlock:(JRJRAccessPermissionContactBlock)contactBlock
                              andUserDeterminedBlock:(JRJRAccessPermissionContactUserDeterminedBlock)userDeterminedBlock;
//通讯录没有权限提示
-(void)jr_contactNotAccessRecommend;
@end
