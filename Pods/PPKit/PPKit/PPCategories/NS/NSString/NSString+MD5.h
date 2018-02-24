//
//  NSString+MD5.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MD5)
/** MD5加密 */
-(NSString *)pp_strMd5;
/** SHA加密 */
-(NSString *)pp_strSha;

@end

NS_ASSUME_NONNULL_END
