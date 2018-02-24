//
//  NSString+IsValid.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+IsValid.h"

@implementation NSString (IsValid)
#pragma mark --- 验证字符串是否是【手机号码】
+(BOOL)pp_strIsPhoneNO:(NSString *)str
{
    return [NSString pp_strIsValidWithValidStyle:PPStringIsValidStylePhoneNO str:str];
}
#pragma mark --- 验证字符串是否是【邮箱】
+(BOOL)pp_strIsEmail:(NSString *)str
{
    return [NSString pp_strIsValidWithValidStyle:PPStringIsValidStyleEmail str:str];
}
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
#pragma mark --- 验证字符串是否是【身份证】
+(BOOL)pp_strIsIDCard:(NSString *)str
{
    NSString *IDCard = str;
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
#pragma mark --- 验证字符串是否是【银行卡】
+(BOOL)pp_strIsBankCard:(NSString *)str
{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[str length];
    int lastNum = [[str substringFromIndex:cardNoLength-1] intValue];
    
    str = [str substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [str substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0){
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)pp_strIsValidWithValidStyle:(PPStringIsValidStyle)validStyle str:(NSString *)str
{
    if (validStyle == PPStringIsValidStylePhoneNO || validStyle == PPStringIsValidStyleEmail) {
        NSPredicate *predicate = [NSPredicate pp_predicateMakeWithValidStyle:validStyle];
        return [predicate evaluateWithObject:str];
    }else if (validStyle == PPStringIsValidStyleEmail){
        return [NSString pp_strIsIDCard:str];
    }else if (validStyle == PPStringIsValidStyleBankCard){
        return [NSString pp_strIsBankCard:str];
    }
    return NO;
}


-(BOOL)pp_isAllLetter
{
    return [self judgeRegularWith:PPStringTypeLetter];
}
-(BOOL)pp_isLetter
{
    return [self matchRegularWith:PPStringTypeLetter];
}
-(BOOL)pp_isAllChinese
{
    return [self judgeRegularWith:PPStringTypeChinese];
}
-(BOOL)pp_isChinese
{
    return [self matchRegularWith:PPStringTypeChinese];
}
-(BOOL)pp_isAllNumber
{
    return [self judgeRegularWith:PPStringTypeNumber];
}
-(BOOL)pp_isNumber
{
    return [self matchRegularWith:PPStringTypeNumber];
}
#pragma mark --- 判断全部是不是满足
-(BOOL)judgeRegularWith:(PPStringType)type
{
    BOOL ppIs = YES;
    for (int i = 0; i<self.length; i++) {
        NSString *indexStr = [self substringWithRange:NSMakeRange(i, 1)];
        BOOL ppIndexIs = YES; //当前字符串是否满足
        if (type == PPStringTypeNumber) {
            ppIndexIs = [indexStr pp_isNumber];
        }else if (type == PPStringTypeLetter){
            ppIndexIs = [indexStr pp_isLetter];
        }else if (type == PPStringTypeChinese){
            ppIndexIs = [indexStr pp_isChinese];
        }
        if (!ppIndexIs) {
            ppIs = NO; //一个为假，便假
            break;
        }
    }
    return ppIs;
}

#pragma mark --- 用正则判断条件
-(BOOL)matchRegularWith:(PPStringType)type
{
    NSString *regularStr = @"";
    switch (type) {
        case PPStringTypeNumber:  //数字
            regularStr = @"^[0-9]*$";
            break;
        case PPStringTypeLetter:  //字母
            regularStr = @"^[A-Za-z]+$";
            break;
        case PPStringTypeChinese:  //汉字
            regularStr = @"^[\u4e00-\u9fa5]{0,}$";
            break;
        default:
            break;
    }
    NSPredicate *regextestA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularStr];
    
    if ([regextestA evaluateWithObject:self] == YES){
        return YES;
    }
    return NO;
}
@end

@implementation NSPredicate (EasyMake)

+(NSPredicate *)pp_predicateMakeWithValidStyle:(PPStringIsValidStyle)validStyle
{
    if (validStyle == PPStringIsValidStylePhoneNO) {
        return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", K_Regex_PhoneNO];
    }else if (validStyle == PPStringIsValidStyleEmail){
        return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", K_Regex_Email];
    }else{
        return nil;
    }
}
@end
