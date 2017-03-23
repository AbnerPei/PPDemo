//
//  NSString+Verify.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 "字符串"各种验证
 */
@interface NSString (Verify)

/**
 验证【身份证】
 */
-(BOOL)pp_isIDCard;

/**
 验证【手机号】
 */
-(BOOL)pp_isPhoneNumber;

@end
