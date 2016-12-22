//
//  NSString+PPProcess.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/12/22.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kPPProcessStringIsAllLetter;       //字符串全字母
extern NSString *const kPPProcessStringFirstIsLetter;     //首个字符串为字母 


/** 某个字符串类型 */
typedef NS_ENUM(NSInteger,PPStringType){
    PPStringTypeNumber,
    PPStringTypeLetter,
    PPStringTypeChinese
};

/**
 字符串加工【如：去除所有空格，去除特殊字符，字母大写等】
 */
@interface NSString (PPProcess)

/** 在一个字符串（self）中，用一个字符串(needStr)替换另一个字符串(replaceStr) 【所有的】 */
-(NSString *)pp_replaceStr:(NSString *)replaceStr
                withString:(NSString *)needStr;

/** 截取一个字符串【startStr】和【endStr】中间的部分 */
-(NSString *)pp_getMiddleStringWithStartStr:(NSString *)startStr
                                  andEndStr:(NSString *)endStr;

/** 移除字符串所有的空白 【即 @“ ” 到 @“”】 */
-(NSString *)pp_removeAllBlankStr;

/** 移除字符串所有的特殊字符 */
-(NSString *)pp_removeAllSpecialLetter;


/** 字符串是不是纯字母 */
-(BOOL)pp_isAllLetter;
/** 【某个字符串】是不是字母 */
-(BOOL)pp_isLetter;
/** 字符串是不是纯汉字 */
-(BOOL)pp_isAllChinese;
/** 【某个字符串】是不是汉字 */
-(BOOL)pp_isChinese;
/** 字符串是不是纯汉字 */
-(BOOL)pp_isAllNumber;
/** 【某个字符串】是不是汉字 */
-(BOOL)pp_isNumber;


/*
 乘机人规则： 【根据携程的来处理】
 1. 姓名需与所持证件的姓名一致。
 2. 中文姓名
 . 若持护照乘机，必须确认护照上有中文姓名。
 . 生僻字可用拼音代替，拼音之后不可再输入汉字，需用拼音代替。例如：“王鬳军”可输入“王yanjun”
 . 姓名中有特殊符号“.”“-”等，可不用输入，例如：“汉祖然.买卖提”可输入“汉祖然买卖提”。
 . 香港、台湾、澳门的护照不支持国内航班，请改用其它证件。
 */
/** 处理乘机人姓名 */
-(NSString *)pp_setupPlanePassengerName;

/** 处理护照姓和名 【去除字符串所有的汉字，保留所有的英文】*/
-(NSString *)pp_setupPassportName;


@end
