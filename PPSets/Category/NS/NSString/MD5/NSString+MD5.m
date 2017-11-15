//
//  NSString+MD5.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)
#pragma mark --- MD5加密
-(NSString *)pp_string_md5
{
    const char *cStr = [self cStringUsingEncoding:(NSUTF8StringEncoding)];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSString *md5Str = @"";
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        md5Str = [md5Str stringByAppendingFormat:@"%02x",digest[i]];
    }
    return md5Str;
}
#pragma mark --- SHA加密
-(NSString *)pp_string_sha
{
    const char *cStr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *shaData = [NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(shaData.bytes, (CC_LONG)shaData.length, digest);
    NSString *shaStr = @"";
    for (int i = 0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        shaStr = [shaStr stringByAppendingFormat:@"%02x",digest[i]];
    }
    return shaStr;
}

@end
