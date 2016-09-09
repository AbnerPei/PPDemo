//
//  NSObject+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PPSets)

@end


@interface NSObject (PPChangeState)
/**
 *  处理字符串为nil和NULL类型的情况
 */
-(NSString*)pp_getSafeStr:(NSString *)safeStr;

//默认是@""字符串
-(NSString*)pp_safeString;

@end