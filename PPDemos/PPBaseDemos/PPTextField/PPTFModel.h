//
//  PPTFModel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 测试用的模型（奇葩模型）
 */
@interface PPTFModel : NSObject

/** name  */
@property (nonatomic,copy) NSString *pptfName;
/** name 区分中英文 */
@property (nonatomic,copy) NSString *pptfNameCNEN;
/** password */
@property (nonatomic,copy) NSString *pptfPassword;
/** password 又有某些特殊字符可以输入*/
@property (nonatomic,copy) NSString *pptfPasswordSpecial;
/** phoneNumber */
@property (nonatomic,copy) NSString *pptfPhone;
/** 条码（来自商品条码13位纯数字） 【纯数字，最多13位】 */
@property (nonatomic,copy) NSString *pptfBarCode;
/** price  */
@property (nonatomic,copy) NSString *pptfPrice;
/** price  首位可以输入. */
@property (nonatomic,copy) NSString *pptfPricePointHeader;
/** 可以输入特殊字符 */
@property (nonatomic,copy) NSString *SpecialCharacterYes;
/** 不可以输入特殊字符 */
@property (nonatomic,copy) NSString *SpecialCharacterNo;
/** 不可以输入特殊字符，但某些特殊字符又可以输入，如¥ */
@property (nonatomic,copy) NSString *SpecialCharacterNoSpecial;

@end
