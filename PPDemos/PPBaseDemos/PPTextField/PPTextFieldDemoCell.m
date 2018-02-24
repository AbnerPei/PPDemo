//
//  PPTextFieldDemoCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPTextFieldDemoCell.h"
#import "NSMutableAttributedString+PPTextField.h"

@implementation PPTextFieldDemoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCellUI];
    }
    return self;
}
-(void)setupCellWithLimitStyle:(PPTextFieldLimitStyle)style andPPTFModel:(PPTFModel *)aPPTFModel
{

#warning demo实例没有考虑具体数据源，滑动时会出现数据错位
    NSString *leftStr;
    NSString *placeholderStr;
    switch (style) {
        case PPTextFieldLimitStyleName:
            leftStr = @"姓名";
            placeholderStr = @"不区分中英文算长度10";
            self.rightTF.maxTextLength = 10;  //字符串最多10个，便于观察
            self.rightTF.font = [UIFont systemFontOfSize:20];
            
        {
            
            NSMutableAttributedString *nameMutStr = [[NSMutableAttributedString alloc]initWithString:placeholderStr];
            [nameMutStr pp_setColor:[UIColor purpleColor]];
            [nameMutStr pp_setFont:[UIFont systemFontOfSize:6]];
            [nameMutStr pp_setKern:@2];
            self.rightTF.attributedPlaceholder = nameMutStr;
        }
            
            break;
        case PPTextFieldLimitStyleNameDifferentiateENCN:
            leftStr = @"姓名";
            placeholderStr = @"区分中英文算长度10";
            self.rightTF.maxCharactersLength = 10;
            
            self.rightTF.returnKeyType = UIReturnKeyDone;  //测试ppTextFieldReturnTypeBlock的回调
            break;
        case PPTextFieldLimitStylePassword:
            leftStr = @"密码";
            placeholderStr = @"只能数字和字母";
            self.rightTF.isPassword = YES;
            
            break;
        case PPTextFieldLimitStylePasswordCanSpecial:
            leftStr = @"密码";
            placeholderStr = @"可以输入指定的特殊字符，如@";
            self.rightTF.isPassword = YES;
            self.rightTF.canInputPasswords = @[@"@"];
            break;
        case PPTextFieldLimitStylePhoneNumber:
            leftStr = @"手机号";
            placeholderStr = @"纯数字，最多11位";
            self.rightTF.isPhoneNumber = YES;
            break;
        case PPTextFieldLimitStyleBarCode:
            leftStr = @"条形码";
            placeholderStr = @"最多13位";
            self.rightTF.maxNumberCount = 13;
            break;
        case PPTextFieldLimitStylePrice:
            leftStr = @"价格";
            placeholderStr = @"【不允许首位是.】";
            self.rightTF.isPrice = YES;
            break;
        case PPTextFieldLimitStylePricePointHeader:
            leftStr = @"价格";
            placeholderStr = @"【允许首位是.】";
            self.rightTF.isPriceHeaderPoint = YES;
            break;
        case PPTextFieldLimitStyleSpecialCharacterYes:
            leftStr = @"特殊字符";
            placeholderStr = @"可以输入特殊字符";
            self.rightTF.isSpecialCharacter = YES; //也可以不写，默认是YES
            break;
        case PPTextFieldLimitStyleSpecialCharacterNo:
            leftStr = @"特殊字符";
            placeholderStr = @"不可以输入特殊字符";
            self.rightTF.isSpecialCharacter = NO;
            break;
        case PPTextFieldLimitStyleSpecialCharacterNoButSpecial:
            leftStr = @"特殊字符";
            placeholderStr = @"不可以输入，但某些又可以输入，如# ,";
            self.rightTF.isSpecialCharacter = NO;
            self.rightTF.canInputCharacters = @[@"#",@","];
            break;
   
        default:
            break;
    }
    self.leftLB.text = leftStr;
    if (style != PPTextFieldLimitStyleName) {
        self.rightTF.placeholder = placeholderStr;
    }
}
-(void)creatCellUI
{
    self.leftLB = [[UILabel alloc]init];
    [self.contentView addSubview:self.leftLB];
    self.leftLB.font = [UIFont systemFontOfSize:15];
    
    self.rightTF = [[PPTextfield alloc]init];
    [self.contentView addSubview:self.rightTF];
    self.rightTF.font = [UIFont systemFontOfSize:15];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftLB.frame = CGRectMake(10, 0, 60, self.contentView.frame.size.height);
    
    self.rightTF.frame = CGRectMake(75, 0, ScreenWidth-90, self.contentView.frame.size.height);
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * identifier = @"PPTextFieldDemoCellIdentifier";
    PPTextFieldDemoCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PPTextFieldDemoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
