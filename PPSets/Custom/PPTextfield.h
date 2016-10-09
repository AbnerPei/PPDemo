//
//  PPTextfield.h
//  WTSDK
//
//  Created by Abner on 16/10/9.
//  Copyright © 2016年 zwt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPTextfield : UITextField

/** 纯数字 */
@property(nonatomic,assign)BOOL isOnlyNumber;

/** 最多纯数字个数【isOnlyNumber == yes 有效】，比如手机11位，商品条码13位等 【设置了maxNumberCount,就默认 isOnlyNumber = YES】*/
@property(nonatomic,assign)NSInteger maxNumberCount;

/** 价格(只有一个"."，小数点后保留2位小数) */
@property(nonatomic,assign)BOOL isPrice;

/** 价格是否允许以“.”开头，默认是不允许，如果允许，请设置为YES 【设置了isPriceHeaderPoint,就默认 isPrice = YES】*/
@property(nonatomic,assign)BOOL isPriceHeaderPoint;

/** 字符串最大长度（一个中文2个字符，一个英文1个字符【中文输入法下的都算中文】） */
@property(nonatomic,assign)NSInteger maxCharactersLength;

/** tf.text最大长度（不考虑中英文） */
@property(nonatomic,assign)NSInteger maxTextLength;



@end

@interface PPTFTool : NSObject

+(int)chineseStrCount:(NSString *)str;
//判断一个字符书不是中文。
+(BOOL)isChinese:(NSString*)c;
//计算一段字符串的长度，两个英文字符占一个长度。
+(int)countTheStrLength:(NSString*)strtemp;
//限制只能输入一个“.”
+(void)limitedPointOnlyOne:(UITextField *)tf;
//判断输入字符串是不是数字
+(BOOL)isNumber:(NSString *)str;

@end