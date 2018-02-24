//
//  NSDateFormatter+EasyDateFormatterHelper.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/25.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSDateFormatter+EasyDateFormatterHelper.h"

//横线
static NSString *const kPPNSDateStyleLine_yyyyMMdd_HHmmss         = @"yyyy-MM-dd HH:mm:ss";
static NSString *const kPPNSDateStyleLine_yyyyMMdd_HHmm           = @"yyyy-MM-dd HH:mm";
static NSString *const kPPNSDateStyleLine_yyyyMMdd                = @"yyyy-MM-dd";
static NSString *const kPPNSDateStyleLine_yyMMdd_HHmmss           = @"yy-MM-dd HH:mm:ss";
static NSString *const kPPNSDateStyleLine_yyMMdd_HHmm             = @"yy-MM-dd HH:mm";
static NSString *const kPPNSDateStyleLine_yyMMdd                  = @"yy-MM-dd";
static NSString *const kPPNSDateStyleLine_MMdd_HHmmss             = @"MM-dd HH:mm:ss";
static NSString *const kPPNSDateStyleLine_MMdd_HHmm               = @"MM-dd HH:mm";
static NSString *const kPPNSDateStyleLine_HHmmss                  = @"HH:mm:ss";
static NSString *const kPPNSDateStyleLine_HHmm                    = @"HH:mm";
//斜杠
static NSString *const kPPNSDateStyleSlash_yyyyMMdd_HHmmss        = @"yyyy/MM/dd HH:mm:ss";
static NSString *const kPPNSDateStyleSlash_yyyyMMdd_HHmm          = @"yyyy/MM/dd HH:mm";
static NSString *const kPPNSDateStyleSlash_yyyyMMdd               = @"yyyy/MM/dd";
static NSString *const kPPNSDateStyleSlash_yyMMdd_HHmmss          = @"yy/MM/dd HH:mm:ss";
static NSString *const kPPNSDateStyleSlash_yyMMdd_HHmm            = @"yy/MM/dd HH:mm";
static NSString *const kPPNSDateStyleSlash_yyMMdd                 = @"yy/MM/dd";
static NSString *const kPPNSDateStyleSlash_MMdd_HHmmss            = @"MM/dd HH:mm:ss";
static NSString *const kPPNSDateStyleSlash_MMdd_HHmm              = @"MM/dd HH:mm";
static NSString *const kPPNSDateStyleSlash_HHmmss                 = @"HH:mm:ss";
static NSString *const kPPNSDateStyleSlash_HHmm                   = @"HH:mm";
//中文
static NSString *const kPPNSDateStyleLine_CN_yyyyMMdd_HHmmss      = @"yyyy年MM月dd日 HH时mm分ss秒";
static NSString *const kPPNSDateStyleLine_CN_yyyyMMdd_HHmm        = @"yyyy年MM月dd日 HH时mm分";
static NSString *const kPPNSDateStyleLine_CN_yyyyMMdd             = @"yyyy年MM月dd日";
static NSString *const kPPNSDateStyleLine_CN_yyMMdd_HHmmss        = @"yy年MM月dd日 HH时mm分ss秒";
static NSString *const kPPNSDateStyleLine_CN_yyMMdd_HHmm          = @"yy年MM月dd日 HH时mm分";
static NSString *const kPPNSDateStyleLine_CN_yyMMdd               = @"yy年MM月dd日";
static NSString *const kPPNSDateStyleLine_CN_MMdd_HHmmss          = @"MM月dd日 HH时mm分ss秒";
static NSString *const kPPNSDateStyleLine_CN_MMdd_HHmm            = @"MM月dd日 HH时mm分";
static NSString *const kPPNSDateStyleLine_CN_MMdd                 = @"MM月dd日";
static NSString *const kPPNSDateStyleLine_CN_HHmmss               = @"HH时mm分ss秒";
static NSString *const kPPNSDateStyleLine_CN_HHmm                 = @"HH时mm分";



static NSString *const kPPNSDateStyleSpecialLine_yyyyMMdd_T_HHmmSS     = @"yyyy-MM-ddTHH:mm:ss";


@implementation NSDateFormatter (EasyDateFormatterHelper)
+(NSString *)pp_dateFormatWithDateStyle:(PPNSDateStyle)dateStyle
{
    NSString *dateStyleStr = @"";
    switch (dateStyle) {
            //line(横线)
        case PPNSDateStyleLine_yyyyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_yyyyMMdd_HHmmss;
            break;
        case PPNSDateStyleLine_yyyyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_yyyyMMdd_HHmm;
            break;
        case PPNSDateStyleLine_yyyyMMdd:
            dateStyleStr = kPPNSDateStyleLine_yyyyMMdd;
            break;
        case PPNSDateStyleLine_yyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_yyMMdd_HHmm;
            break;
        case PPNSDateStyleLine_yyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_yyMMdd_HHmm;
            break;
        case PPNSDateStyleLine_yyMMdd:
            dateStyleStr = kPPNSDateStyleLine_yyyyMMdd;
            break;
        case PPNSDateStyleLine_MMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_MMdd_HHmmss;
            break;
        case PPNSDateStyleLine_MMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_MMdd_HHmm;
            break;
            //slash(斜线)
        case PPNSDateStyleSlash_yyyyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleSlash_yyyyMMdd_HHmmss;
            break;
        case PPNSDateStyleSlash_yyyyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleSlash_yyyyMMdd_HHmm;
            break;
        case PPNSDateStyleSlash_yyyyMMdd:
            dateStyleStr = kPPNSDateStyleSlash_yyyyMMdd;
            break;
        case PPNSDateStyleSlash_yyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleSlash_yyMMdd_HHmmss;
            break;
        case PPNSDateStyleSlash_yyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleSlash_yyMMdd_HHmm;
            break;
        case PPNSDateStyleSlash_yyMMdd:
            dateStyleStr = kPPNSDateStyleSlash_yyMMdd;
            break;
        case PPNSDateStyleSlash_MMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleSlash_MMdd_HHmmss;
            break;
        case PPNSDateStyleSlash_MMdd_HHmm:
            dateStyleStr = kPPNSDateStyleSlash_MMdd_HHmm;
            break;
        case PPNSDateStyleSlash_HHmmss:
            dateStyleStr = kPPNSDateStyleSlash_HHmmss;
            break;
        case PPNSDateStyleSlash_HHmm:
            dateStyleStr = kPPNSDateStyleSlash_HHmm;
            break;
            #pragma mark --- 中文的
        case PPNSDateStyleLine_CN_yyyyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_CN_yyyyMMdd_HHmmss;
            break;
        case PPNSDateStyleLine_CN_yyyyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_CN_yyyyMMdd_HHmm;
            break;
        case PPNSDateStyleLine_CN_yyyyMMdd:
            dateStyleStr = kPPNSDateStyleLine_CN_yyyyMMdd;
            break;
        case PPNSDateStyleLine_CN_yyMMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_CN_yyMMdd_HHmmss;
            break;
        case PPNSDateStyleLine_CN_yyMMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_CN_yyMMdd_HHmm;
            break;
        case PPNSDateStyleLine_CN_yyMMdd:
            dateStyleStr = kPPNSDateStyleLine_CN_yyMMdd;
            break;
        case PPNSDateStyleLine_CN_MMdd_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_CN_MMdd_HHmmss;
            break;
        case PPNSDateStyleLine_CN_MMdd_HHmm:
            dateStyleStr = kPPNSDateStyleLine_CN_MMdd_HHmm;
            break;
        case PPNSDateStyleLine_CN_MMdd:
            dateStyleStr = kPPNSDateStyleLine_CN_MMdd;
            break;
        case PPNSDateStyleLine_CN_HHmmss:
            dateStyleStr = kPPNSDateStyleLine_CN_HHmmss;
            break;
        case PPNSDateStyleLine_CN_HHmm:
            dateStyleStr = kPPNSDateStyleLine_CN_HHmm;
            break;
            
            //特殊
        case PPNSDateStyleSpecialLine_yyyyMMdd_T_HHmmSS:
            dateStyleStr = kPPNSDateStyleSpecialLine_yyyyMMdd_T_HHmmSS;
            break;

        default:
            dateStyleStr = @"";
            break;
    }
 
    return dateStyleStr;
}
@end
