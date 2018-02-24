//
//  NSString+Helper.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)
//金额转大写 daiding
+(NSString *)digitUppercaseWithMoney:(NSString *)money;
@end


@interface NSString (Ceilf)
/**
 进一取整法  【4.34 (2) 】---> 【5.00】
 */
+(NSString *)pp_strCeilf:(NSString *)oneFloatStr
            decimalCount:(int)decimalCount;
@end
