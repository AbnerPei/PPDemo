//
//  NSDateFormatter+EasyDateFormatterHelper.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/25.
//  Copyright © 2017年 JinRi . All rights reserved.
//

typedef NS_ENUM(NSInteger,PPNSDateStyle) {
    PPNSDateStyleLine_yyyyMMdd_HHmmss = 0,             // 2017-11-25 16:22:55
    PPNSDateStyleLine_yyyyMMdd_HHmm,                   // 2017-11-25 16:22
    PPNSDateStyleLine_yyyyMMdd,                        // 2017-11-25
    PPNSDateStyleLine_yyMMdd_HHmmss,                   // 17-11-25 16:22:55
    PPNSDateStyleLine_yyMMdd_HHmm,                     // 17-11-25 16:22
    PPNSDateStyleLine_yyMMdd,                          // 17-11-25
    PPNSDateStyleLine_MMdd_HHmmss,                     // 11-25 16:22:55
    PPNSDateStyleLine_MMdd_HHmm,                       // 11-25 16:22
    PPNSDateStyleLine_HHmmss,                          // 16:22:55
    PPNSDateStyleLine_HHmm,                            // 16:22
    PPNSDateStyleSlash_yyyyMMdd_HHmmss,                // 2017/11/25 16:22:55
    PPNSDateStyleSlash_yyyyMMdd_HHmm,                  // 2017/11/25 16:22
    PPNSDateStyleSlash_yyyyMMdd,                       // 2017/11/25
    PPNSDateStyleSlash_yyMMdd_HHmmss,                  // 17/11/25 16:22:55
    PPNSDateStyleSlash_yyMMdd_HHmm,                    // 17/11/25 16:22
    PPNSDateStyleSlash_yyMMdd,                         // 17/11/25 
    PPNSDateStyleSlash_MMdd_HHmmss,                    // 11/25 16:22:55
    PPNSDateStyleSlash_MMdd_HHmm,                      // 11/25 16:22
    PPNSDateStyleSlash_HHmmss,                         // 16:22:55
    PPNSDateStyleSlash_HHmm,                           // 16:22
    //CN是中文的
    PPNSDateStyleLine_CN_yyyyMMdd_HHmmss,              //2017年11月25日 16时22分55秒
    PPNSDateStyleLine_CN_yyyyMMdd_HHmm,                //2017年11月25日 16时22分
    PPNSDateStyleLine_CN_yyyyMMdd,                     //2017年11月25日
    PPNSDateStyleLine_CN_yyMMdd_HHmmss,                //17年11月25日 16时22分55秒
    PPNSDateStyleLine_CN_yyMMdd_HHmm,                  //17年11月25日 16时22分
    PPNSDateStyleLine_CN_yyMMdd,                       //17年11月25日
    PPNSDateStyleLine_CN_MMdd_HHmmss,                  //11月25日 16时22分55秒
    PPNSDateStyleLine_CN_MMdd_HHmm,                    //11月25日 16时22分
    PPNSDateStyleLine_CN_MMdd,                         //11月25日
    PPNSDateStyleLine_CN_HHmmss,                       //16时22分55秒
    PPNSDateStyleLine_CN_HHmm,                         //16时22分
    //特殊的
    PPNSDateStyleSpecialLine_yyyyMMdd_T_HHmmSS         //2018-01-09T21:15:00
    
};

#import <Foundation/Foundation.h>

@interface NSDateFormatter (EasyDateFormatterHelper)
+(NSString *)pp_dateFormatWithDateStyle:(PPNSDateStyle)dateStyle;
@end
