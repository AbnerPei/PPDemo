//
//  NSString+PPProcess.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/12/22.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "NSString+PPProcess.h"

NSString *const kPPProcessStringIsAllLetter = @"kPPProcessStringIsAllLetter";
NSString *const kPPProcessStringFirstIsLetter = @"kPPProcessStringFirstIsLetter";


@implementation NSString (PPProcess)

-(NSString *)pp_replaceStr:(NSString *)replaceStr
                withString:(NSString *)needStr
{
    //判断是否有要替换的字符串
    if ([self containsString:replaceStr]) {
        NSRange jr_range = {0,self.length};
        NSString *str = [self stringByReplacingOccurrencesOfString:replaceStr withString:needStr options:NSLiteralSearch range:jr_range];
        return str;
    }
    //没有，就返回本身
    return self;
}

-(NSString *)pp_getMiddleStringWithStartStr:(NSString *)startStr
                                  andEndStr:(NSString *)endStr
{
    if ([self containsString:startStr] && [self containsString:endStr]) {
        NSString *str = [[[[self componentsSeparatedByString:startStr] lastObject]componentsSeparatedByString:endStr] firstObject];
        return str;
    }
    //没有，就返回本身
    return self;
}

-(NSString *)pp_removeAllBlankStr
{
    if (self.length > 0) {
       return [self pp_replaceStr:@" " withString:@""];
    }else{
        return @"";
    }
}

/**  一般输入法，特殊字符就是除了汉字，数字，字母，而网上找了各种特殊字符的，都没有可以好用的，所以就想着去排除这三种情况  */
-(NSString *)pp_removeAllSpecialLetter
{
    if (self.length > 0) {
        NSMutableString *resultStr = [[NSMutableString alloc]init];
        for (int i = 0; i<self.length; i++) {
            NSString *indexStr = [self substringWithRange:NSMakeRange(i, 1)];
            if ([indexStr pp_isLetter] || [indexStr pp_isNumber] || [indexStr pp_isChinese]) {
                [resultStr appendString:indexStr];
            }
        }
        if (resultStr.length > 0) {
            return resultStr;
        }else{
            return @"";
        }
    }else{
        return @"";
    }
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
/** 处理乘机人姓名 */
-(NSString *)pp_setupPlanePassengerName
{
    //对字符串处理
    NSString *ppResultStr = @"";
    ppResultStr = [self pp_removeAllBlankStr];
    ppResultStr = [ppResultStr pp_removeAllSpecialLetter];
    
    if (ppResultStr.length > 0) {
        
        //1、 纯英文
        //2、 纯中文
        //3、 英文在前，中文在后，又跟英文，再跟中文
        //4、 中文在前，英文在后，又跟中文
        if ([ppResultStr pp_isAllLetter]) {
            return kPPProcessStringIsAllLetter;
        }else if ([ppResultStr pp_isAllChinese]){
            return ppResultStr;
        }else{
            NSString *firstStr = [ppResultStr substringWithRange:NSMakeRange(0, 1)];
            if ([firstStr pp_isLetter]) { //首个字符串为字母
                return kPPProcessStringFirstIsLetter;
            }else{
                //首个字符串为汉字
                BOOL hasLetter = NO;
                NSString *resultStr = ppResultStr;
                
                for (int i = 1; i<ppResultStr.length; i++) {
                    NSString *temp = [ppResultStr substringWithRange:NSMakeRange(i,1)];
                    if ([temp pp_isLetter]) { //只要有，hasLetter边为YES
                        hasLetter = YES;
                    }
                    if (hasLetter && ![temp pp_isLetter]) {
                        resultStr = [ppResultStr substringToIndex:i];
                        break;
                    }
                }
                //所有的字母默认为大写
                resultStr = [resultStr uppercaseString];
                return resultStr;
            }
        }
    }else{
        return @"";
    }
}

/** 处理护照姓和名 【去除字符串所有的汉字，保留所有的英文】*/
-(NSString *)pp_setupPassportName
{
    if (self.length > 0) {
        NSMutableString *tempStr = [[NSMutableString alloc]init];
        for (int i = 0; i<self.length; i++) {
            NSString *currentStr = [self substringWithRange:NSMakeRange(i,1)];
            if ([currentStr pp_isLetter]) { //字母就拼接
                [tempStr appendString:currentStr];
            }
        }
        if (tempStr.length > 0) {
            NSString *backStr = [NSString stringWithFormat:@"%@",tempStr];
            backStr = [backStr uppercaseString];
            return backStr;
        }
    }
    return @"";
}
@end
