//
//  JRNumberTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 17/3/2.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "JRNumberTool.h"
@implementation JRNumberTool

+(NSString *)jr_getFloat:(NSString *)oneFloatStr decimalCount:(int)decimalCount
{
    //空字符串处理
    if ([oneFloatStr isKindOfClass:[NSNull class]] || oneFloatStr == nil || [oneFloatStr length] < 1) {
        return @"";
    }
    if (decimalCount > 16) {
        decimalCount = 16;
    }
    
    NSString *floatStr = @"";
    switch (decimalCount) {
        case 0:
            floatStr = [NSString stringWithFormat:@"%.0f",[oneFloatStr floatValue]];
            break;
        case 1:
            floatStr = [NSString stringWithFormat:@"%.1f",[oneFloatStr floatValue]];
            break;
        case 2:
            floatStr = [NSString stringWithFormat:@"%.2f",[oneFloatStr floatValue]];
            break;
        case 3:
            floatStr = [NSString stringWithFormat:@"%.3f",[oneFloatStr floatValue]];
            break;
        case 4:
            floatStr = [NSString stringWithFormat:@"%.4f",[oneFloatStr floatValue]];
            break;
        case 5:
            floatStr = [NSString stringWithFormat:@"%.5f",[oneFloatStr floatValue]];
            break;
        case 6:
            floatStr = [NSString stringWithFormat:@"%.6f",[oneFloatStr floatValue]];
            break;
        case 7:
            floatStr = [NSString stringWithFormat:@"%.7f",[oneFloatStr floatValue]];
            break;
        case 8:
            floatStr = [NSString stringWithFormat:@"%.8f",[oneFloatStr floatValue]];
            break;
        case 9:
            floatStr = [NSString stringWithFormat:@"%.9f",[oneFloatStr floatValue]];
            break;
        case 10:
            floatStr = [NSString stringWithFormat:@"%.10f",[oneFloatStr floatValue]];
            break;
        case 11:
            floatStr = [NSString stringWithFormat:@"%.11f",[oneFloatStr floatValue]];
            break;
        case 12:
            floatStr = [NSString stringWithFormat:@"%.12f",[oneFloatStr floatValue]];
            break;
        case 13:
            floatStr = [NSString stringWithFormat:@"%.13f",[oneFloatStr floatValue]];
            break;
        case 14:
            floatStr = [NSString stringWithFormat:@"%.14f",[oneFloatStr floatValue]];
            break;
        case 15:
            floatStr = [NSString stringWithFormat:@"%.15f",[oneFloatStr floatValue]];
            break;
        case 16:
            floatStr = [NSString stringWithFormat:@"%.16f",[oneFloatStr floatValue]];
            break;
            
        default:
            break;
    }
    
    return floatStr;

}

#pragma mark  --- 进一取整
+(NSString *)jr_Ceilf:(NSString *)oneFloatStr decimalCount:(int)decimalCount
{
    float resultFloat = ceilf([oneFloatStr floatValue]);
    NSString *floatStr = [NSString stringWithFormat:@"%f",resultFloat];
    
    floatStr = [JRNumberTool jr_getFloat:floatStr decimalCount:decimalCount];
    return floatStr;
}

+(NSString *)jr_twoCeilf:(NSString *)oneFloatStr
{
    float resultFloat = ceilf([oneFloatStr floatValue]);
    NSString *floatStr = [NSString stringWithFormat:@"%f",resultFloat];
    
    floatStr = [JRNumberTool jr_getFloat:floatStr decimalCount:2];
    return floatStr;
}


/** 字符串(self)中是否包含某个字符(str) */
+(BOOL)oneStr:(NSString *)oneStr isContainsString:(NSString *)str
{
    //字符串不为空
    if (oneStr.length == 0 || str.length == 0) {
        return NO;
    }
    if (PPIOS(8)) { //iOS8及8以后
        if ([oneStr containsString:str]) {
            return YES;
        }else{
            return NO;
        }
    }else{
        //iOS7及以前
        if ([oneStr rangeOfString:str].location != NSNotFound) {
            return YES;
        }else{
            return NO;
        }
    }
}
@end
