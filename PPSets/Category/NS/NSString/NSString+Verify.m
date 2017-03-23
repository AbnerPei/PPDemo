//
//  NSString+Verify.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

#pragma mark --- 身份证验证
//必须满足以下规则
//1. 长度必须是18位，前17位必须是数字，第十八位可以是数字或X
//2. 前两位必须是以下情形中的一种：11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91
//3. 第7到第14位出生年月日。第7到第10位为出生年份；11到12位表示月份，范围为01-12；13到14位为合法的日期
//4. 第17位表示性别，双数表示女，单数表示男
//5. 第18位为前17位的校验位
//算法如下：
//（1）校验和 = (n1 + n11) * 7 + (n2 + n12) * 9 + (n3 + n13) * 10 + (n4 + n14) * 5 + (n5 + n15) * 8 + (n6 + n16) * 4 + (n7 + n17) * 2 + n8 + n9 * 6 + n10 * 3，其中n数值，表示第几位的数字
//（2）余数 ＝ 校验和 % 11
//（3）如果余数为0，校验位应为1，余数为1到10校验位应为字符串“0X98765432”(不包括分号)的第余数位的值（比如余数等于3，校验位应为9）
//6. 出生年份的前两位必须是19或20
-(BOOL)pp_isIDCard
{
    NSString *IDCard = self;
    IDCard = [IDCard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([IDCard length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:IDCard]) {
        return NO;
    }
    int summary = ([IDCard substringWithRange:NSMakeRange(0,1)].intValue + [IDCard substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([IDCard substringWithRange:NSMakeRange(1,1)].intValue + [IDCard substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([IDCard substringWithRange:NSMakeRange(2,1)].intValue + [IDCard substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([IDCard substringWithRange:NSMakeRange(3,1)].intValue + [IDCard substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([IDCard substringWithRange:NSMakeRange(4,1)].intValue + [IDCard substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([IDCard substringWithRange:NSMakeRange(5,1)].intValue + [IDCard substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([IDCard substringWithRange:NSMakeRange(6,1)].intValue + [IDCard substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [IDCard substringWithRange:NSMakeRange(7,1)].intValue *1 + [IDCard substringWithRange:NSMakeRange(8,1)].intValue *6
    + [IDCard substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[IDCard substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

#pragma mark --- 手机号验证
-(BOOL)pp_isPhoneNumber
{
    NSString * MOBILE = @"^1[3578]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self] == YES;
}
@end
