//
//  PPTextFieldDemoCell.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

/*
 
 
 */
typedef NS_ENUM(NSInteger,PPTextFieldLimitStyle) {
    PPTextFieldLimitStyleName = 0,                       //名字 【不区分中英文算长度】
    PPTextFieldLimitStyleNameDifferentiateENCN,          //名字 【区分中英文算长度】
    PPTextFieldLimitStylePassword,                       //密码  【只能数字和字母】
    PPTextFieldLimitStylePasswordCanSpecial,             //密码  【可以输入指定的特殊字符，如@】
    PPTextFieldLimitStylePhoneNumber,                    //手机号 【纯数字，最多11位】
    PPTextFieldLimitStyleBarCode,                        //条形码 【纯数字，最多13位】
    PPTextFieldLimitStylePrice,                          //价格  【不允许首位是.】
    PPTextFieldLimitStylePricePointHeader,               //价格  【允许首位是.】
    PPTextFieldLimitStyleSpecialCharacterYes,            //特殊字符 【可以输入】
    PPTextFieldLimitStyleSpecialCharacterNo,             //特殊字符 【不可以输入】
    PPTextFieldLimitStyleSpecialCharacterNoButSpecial,   //特殊字符 【不可以输入，但某些又可以输入，如¥】
    

};

#import <UIKit/UIKit.h>
#import "PPCustomTextField.h"
#import "PPTFModel.h"

@interface PPTextFieldDemoCell : UITableViewCell

/** left title LB  */
@property(nonatomic,strong)UILabel *leftLB;

/** PPTextField 输入框  */
@property(nonatomic,strong)PPCustomTextField *rightTF;

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setupCellWithLimitStyle:(PPTextFieldLimitStyle)style andPPTFModel:(PPTFModel *)aPPTFModel;
@end
