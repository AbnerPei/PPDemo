//
//  NSString+Helper.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)
//金额转大写
+(NSString *)digitUppercaseWithMoney:(NSString *)money
{
    NSMutableString *moneyStr=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%.2f",[money doubleValue]]];
    NSArray *MyScale=@[@"分", @"角", @"元", @"拾", @"佰", @"仟", @"万", @"拾", @"佰", @"仟", @"亿", @"拾", @"佰", @"仟", @"兆", @"拾", @"佰", @"仟" ];
    NSArray *MyBase=@[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
    
    NSArray *integerArray = @[@"拾", @"佰", @"仟", @"万", @"拾万", @"佰万", @"仟万", @"亿", @"拾亿", @"佰亿", @"仟亿", @"兆", @"拾兆", @"佰兆", @"仟兆"];
    
    
    NSMutableString * M = [[NSMutableString alloc] init];
    [moneyStr deleteCharactersInRange:NSMakeRange([moneyStr rangeOfString:@"."].location, 1)];
    for(NSInteger i=moneyStr.length;i>0;i--)
    {
        NSInteger MyData=[[moneyStr substringWithRange:NSMakeRange(moneyStr.length-i, 1)] integerValue];
        [M appendString:MyBase[MyData]];
        
        //判断是否是整数金额
        if (i == moneyStr.length) {
            NSInteger l = [[moneyStr substringFromIndex:1] integerValue];
            if (MyData > 0 &&
                l == 0 ) {
                NSString *integerString = @"";
                if (moneyStr.length > 3) {
                    integerString = integerArray[moneyStr.length-4];
                }
                [M appendString:[NSString stringWithFormat:@"%@%@",integerString,@"元整"]];
                break;
            }
        }
        
        if([[moneyStr substringFromIndex:moneyStr.length-i+1] integerValue]==0
           && i != 1
           && i != 2)
        {
            [M appendString:@"元整"];
            break;
        }
        [M appendString:MyScale[i-1]];
    }
    return M;
}

@end

@implementation NSString(Ceilf)
#pragma mark --- 进一取整法  【4.34 (2) 】---> 【5.00】
+(NSString *)pp_strCeilf:(NSString *)oneFloatStr decimalCount:(int)decimalCount
{
    float resultFloat = ceilf([oneFloatStr floatValue]);
    NSString *floatStr = [NSString stringWithFormat:@"%f",resultFloat];
    floatStr = [NSString getFloat:floatStr decimalCount:decimalCount];
    return floatStr;
}
+(NSString *)getFloat:(NSString *)oneFloatStr decimalCount:(int)decimalCount
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

@end
