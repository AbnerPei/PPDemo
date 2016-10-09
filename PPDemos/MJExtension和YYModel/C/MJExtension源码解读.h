//
//  MJExtension源码解读.h
//  PPDemos
//
//  Created by Abner on 16/9/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#ifndef MJExtension_____h
#define MJExtension_____h

####字典转模型
>
```
User *user = [User mj_objectWithKeyValues:arr]; /**第001步*/
```
                      ▼
                      ▼
```
+ (instancetype)mj_objectWithKeyValues:(id)keyValues
{
    return [self mj_objectWithKeyValues:keyValues context:nil];
}
```
-(UIImageView *)proImgView
{
    if (_proImgView == nil) {
        _proImgView = [[UIImageView alloc]init];
    }
    [self.contentView addSubview:_proImgView];
    return _proImgView;
}
-(UILabel *)pronameLB
{
    if (_pronameLB == nil) {
        _pronameLB = [[UILabel alloc]init];
        _pronameLB.textColor = SetColorRGBValue(0x000000, 1.0);
        _pronameLB.font = FontSet(16);
        _pronameLB.numberOfLines = 0;
        _pronameLB.text = @"";
    }
    [self.contentView addSubview:_pronameLB];
    return _pronameLB;
}
//懒猫价lb
-(UILabel *)lcPriceLB
{
    if (_lcPriceLB == nil) {
        _lcPriceLB = [[UILabel alloc]init];
        _lcPriceLB.font = [UIFont systemFontOfSize:13];
        _lcPriceLB.textColor = SetColorRGBValue(0x999999, 1.0);
        _lcPriceLB.text = @"懒猫价:";
        [self.contentView addSubview:_lcPriceLB];
        
    }
    return _lcPriceLB;
}
-(UILabel *)lcQuanLB
{
    if (_lcQuanLB == nil) {
        _lcQuanLB = [[UILabel alloc]init];
        //懒猫券价
        _lcQuanLB.font = [UIFont systemFontOfSize:10];
        _lcQuanLB.layer.masksToBounds = YES;
        _lcQuanLB.layer.cornerRadius = 4.0;
        _lcQuanLB.backgroundColor = SetColorRGBValue(0xff6600, 1.0);
        _lcQuanLB.textColor = SetColorRGBValue(0xffffff, 1.0);
        _lcQuanLB.textAlignment = NSTextAlignmentCenter;
    }
    [self.contentView addSubview:_lcQuanLB];
    
    return _lcQuanLB;
}
-(UILabel *)proPriceLB
{
    if (_proPriceLB == nil) {
        _proPriceLB = [[UILabel alloc]init];
        _proPriceLB.font = [UIFont boldSystemFontOfSize:16];
        _proPriceLB.textColor = SetColorRGBValue(0xff6600, 1.0);
    }
    [self.contentView addSubview:_proPriceLB];
    return _proPriceLB;
}
-(UILabel *)proPriceLB1
{
    if (_proPriceLB1 == nil) {
        _proPriceLB1 = [[UILabel alloc]init];
        _proPriceLB1.font = [UIFont boldSystemFontOfSize:20];
        _proPriceLB1.textColor = SetColorRGBValue(0xff6600, 1.0);
        _proPriceLB1.text = @"";
    }
    [self.contentView addSubview:_proPriceLB1];
    return _proPriceLB1;
}
-(UILabel *)salePriceLB
{
    if (_salePriceLB == nil) {
        _salePriceLB = [[UILabel alloc]init];
        _salePriceLB.font = FontSet(12);
        _salePriceLB.textColor = SetColorRGBValue(0x999999, 1.0);
        _salePriceLB.text = @"";
    }
    [self.contentView addSubview:_salePriceLB];
    return _salePriceLB;
}
-(UILabel *)proMarketPriceLB
{
    if (_proMarketPriceLB == nil) {
        _proMarketPriceLB = [[UILabel alloc]init];
        _proMarketPriceLB.font = FontSet(12);
        _proMarketPriceLB.textColor = SetColorRGBValue(0x999999, 1.0);
        _proMarketPriceLB.text = @"";
    }
    [self.contentView addSubview:_proMarketPriceLB];
    return _proMarketPriceLB;
}
-(UILabel *)proYuShouLB
{
    if (_proYuShouLB == nil) {
        //预售
        _proYuShouLB = [[UILabel alloc]init];
        _proYuShouLB.layer.masksToBounds = YES;
        _proYuShouLB.layer.borderWidth = 1.0;
        _proYuShouLB.layer.borderColor = SetColorRGBValue(0xFF0A0A, 1.0).CGColor;
        _proYuShouLB.layer.cornerRadius = 4;
        _proYuShouLB.textColor = SetColorRGBValue(0xFF0A0A, 1.0);
        _proYuShouLB.textAlignment = NSTextAlignmentCenter;
        _proYuShouLB.font = FontSet(10);
        _proYuShouLB.text = @"预售";
    }
    [self.contentView addSubview:_proYuShouLB];
    return _proYuShouLB;
}
-(UILabel *)proPublicTimeLB
{
    if (_proPublicTimeLB == nil) {
        _proPublicTimeLB = [[UILabel alloc]init];
        _proPublicTimeLB.textColor = SetColorRGBValue(0x000000, 0.5);
        _proPublicTimeLB.font = FontSet(12);
        _proPublicTimeLB.text = @"";
    }
    [self.contentView addSubview:_proPublicTimeLB];
    return _proPublicTimeLB;
}
-(UIView *)proBgRedView
{
    if (_proBgRedView == nil) {
        _proBgRedView = [[UIView alloc]init];
        _proBgRedView.backgroundColor = [UIColor redColor];
        _proBgRedView.layer.masksToBounds = YES;
        _proBgRedView.layer.cornerRadius = 4;
        
        
        UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(qiangW, 0.5, ScreenWidth-20.5-qiangW, 44)];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self.proBgRedView addSubview:whiteView];
        whiteView.layer.masksToBounds = YES;
        whiteView.layer.cornerRadius = 4;
        
        CGFloat margignL = 6.5;
        UILabel *qiangLb = [[UILabel alloc]initWithFrame:CGRectMake(0, margignL, qiangW, 16)];
        qiangLb.text = @"抢";
        qiangLb.textColor = [UIColor whiteColor];
        qiangLb.font = FontSet(14);
        qiangLb.textAlignment = NSTextAlignmentCenter;
        [self.proBgRedView addSubview:qiangLb];
        
        UILabel *gouLb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(qiangLb.frame), qiangW, 14)];
        gouLb.text = @"购";
        gouLb.textColor = [UIColor whiteColor];
        gouLb.font = FontSet(16);
        gouLb.textAlignment = NSTextAlignmentCenter;
        [self.proBgRedView addSubview:gouLb];
        
        //提示lable
        // 64 = 10+qiangW+10+10
        UILabel *reminderLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 6, ScreenWidth-20.5-qiangW-10, 14)];
        reminderLb.text = @"距离抢购结束还剩:";
        reminderLb.textColor = SetColorRGBValue(0x000000, 0.5);
        reminderLb.font = FontSet(14);
        [whiteView addSubview:reminderLb];
        
        //秒杀倒计时
        self.proMiaoShaLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 24, ScreenWidth-20.5-qiangW-10, 14)];
        [whiteView addSubview:self.proMiaoShaLB];
        self.proMiaoShaLB.textColor = SetColorRGBValue(0xFF0A0A, 1.0);
        self.proMiaoShaLB.font = FontSet(14);
        self.proMiaoShaLB.text = @"";
    }
    [self.contentView addSubview:_proBgRedView];
    return _proBgRedView;
}
-(UIView *)middleBgV
{
    if (_middleBgV == nil) {
        _middleBgV = [[UIView alloc]init];
        _middleBgV.backgroundColor = BackColor;
    }
    [self.contentView addSubview:_middleBgV];
    return _middleBgV;
}
-(UIView *)promotionView
{
    //促销特加的
    if (_promotionView == nil) {
        _promotionView = [[UIView alloc]init];
        _promotionView.backgroundColor = [UIColor whiteColor];
        
        UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth-10, 1)];
        [_promotionView addSubview:topLine];
        topLine.backgroundColor = SetColor(245, 245, 245, 1.0);
        
        UILabel *promotionTitleLB = [[UILabel alloc]init];
        _promotionTitleLB = promotionTitleLB;
        [_promotionView addSubview:_promotionTitleLB];
        _promotionTitleLB.font = FontSet(10);
        _promotionTitleLB.textColor = SetColorRGBValue(0x999999, 1.0);
        _promotionTitleLB.backgroundColor = [UIColor whiteColor];
        
        UILabel *promotionTagLB = [[UILabel alloc]init];
        _promotionTagLB = promotionTagLB;
        [_promotionView addSubview:_promotionTagLB];
        _promotionTagLB.layer.masksToBounds = YES;
        _promotionTagLB.layer.borderWidth = 1.0;
        _promotionTagLB.layer.borderColor = MainColor.CGColor;
        _promotionTagLB.layer.cornerRadius = 4;
        _promotionTagLB.textColor = [UIColor whiteColor];
        _promotionTagLB.textAlignment = NSTextAlignmentCenter;
        _promotionTagLB.font = FontSet(10);
        _promotionTagLB.backgroundColor = MainColor;
        
        UILabel *promotionDetailLB = [[UILabel alloc]init];
        _promotionDetailLB = promotionDetailLB;
        [_promotionView addSubview:_promotionDetailLB];
        _promotionDetailLB.font = FontSet(10);
        _promotionDetailLB.textColor = SetColorRGBValue(0x999999, 1.0);
        _promotionDetailLB.backgroundColor = [UIColor whiteColor];
        
    }
    [self.contentView addSubview:_promotionView];
    
    return _promotionView;
}
#endif /* MJExtension_____h */
