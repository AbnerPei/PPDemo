//
//  WholesaleCell.m
//  MassonryDemos
//
//  Created by Abner on 16/6/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "WholesaleCell.h"

@interface WholesaleCell ()

@property (strong, nonatomic) UIView *middleLine;
@property (strong, nonatomic) UIView *bottomLine;
@property (strong, nonatomic) UIButton *maskBT_L; //铺在最上面，来响应点击事件
@property (strong, nonatomic) UIButton *maskBT_R;


@end
@implementation WholesaleCell
-(void)setupWholesaleCellData:(NSArray *)imgNames titles:(NSArray *)titles
{
    self.leftV.imgV.image = [UIImage imageNamed:imgNames[0]];
    self.rightV.imgV.image = [UIImage imageNamed:imgNames[1]];
    self.leftV.textLB.text = titles[0];
    self.rightV.textLB.text = titles[1];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
//布局
-(void)setupUI
{
    //1.添加子视图
    self.leftV = [[WholesaleView alloc]init];
    [self.contentView addSubview:self.leftV];
    self.rightV = [[WholesaleView alloc]init];
    [self.contentView addSubview:self.rightV];
    
    self.middleLine = [[UIView alloc]init];
    self.middleLine.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [self.contentView addSubview:self.middleLine];
    
    self.bottomLine = [[UIView alloc]init];
    self.bottomLine.backgroundColor = PPSetColorRGBValue(0xe0e0e0, 1.0);
    [self.contentView addSubview:self.bottomLine];
    
    self.maskBT_L = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.maskBT_L];
    self.maskBT_L.tag = 123;
    [self.maskBT_L addTarget:self action:@selector(maskBtClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.maskBT_R = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.maskBT_R];
    self.maskBT_R.tag = 124;
    [self.maskBT_R addTarget:self action:@selector(maskBtClicked:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)layoutSubviews
{
    [self.leftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth/2-0.5, 104));
    }];
    
    [self.rightV makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView).offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth/2-0.5, 104));
    }];
    
    [self.middleLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.centerX.equalTo(self.contentView.centerX);
        make.size.mas_equalTo(CGSizeMake(1, 104));
    }];
    
    [self.bottomLine makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(104, 0, 0, 0));
        make.height.equalTo(@1); //感觉多余
    }];
    
    [self.maskBT_L mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.height.equalTo(self.leftV);
    }];
    
    [self.maskBT_R mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.height.equalTo(self.rightV);
    }];

}

-(void)maskBtClicked:(UIButton *)btn
{
    if (btn.tag == 123) {
        if (self.WholesaleCellClickedBlock) {
            self.WholesaleCellClickedBlock(YES);
        }
    }else{
        if (self.WholesaleCellClickedBlock) {
            self.WholesaleCellClickedBlock(NO);
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//---------------------------

@interface WholesaleView ()

@end

@implementation WholesaleView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    self.imgV = [[UIImageView alloc]init];
    [self addSubview:self.imgV];
    
    self.textLB = [[UILabel alloc]init];
    [self addSubview:self.textLB];
    self.textLB.textAlignment = NSTextAlignmentCenter;
    self.textLB.font = [UIFont boldSystemFontOfSize:14];
    self.textLB.textColor = PPSetColorRGBValue(0x333333, 1.0);
}
-(void)layoutSubviews
{
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.textLB makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgV.mas_bottom).offset(5);
        make.centerX.width.equalTo(self);
    }];
    
}

@end

