//
//  PPToolsHelper.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPToolsHelper : NSObject
/**
 2016--10--20
 //拨打电话
 webV方式： 这种方法，打完电话后还会回到原来的程序，也会弹出提示！
 基本方式 ： 这种方法，拨打完电话回不到原来的应用，会停留在通讯录里，而且是直接拨打，不弹出提示！（在iOS9.0之后，这个方法也是可以回到原来的应用）
 @param phoneNO 电话号码
 @param isUseWebV 是不是用webView的方式
 */
+(void)pp_tool_phone:(NSString *)phoneNO isUseWebView:(BOOL)isUseWebV;
@end
