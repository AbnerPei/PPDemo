//
//  MAS_TwoViewHiddenViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import "MAS_TwoViewHiddenViewController.h"
#import <Masonry/Masonry.h>
#import "MAS_CommentModel.h"

@interface MAS_TwoViewHiddenViewController ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) MAS_CommentModel *commentModel;

@end

@implementation MAS_TwoViewHiddenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    [self setupConstraints];
}

- (void)setupUI
{
    [self.view addSubview:self.leftLabel];
    [self.view addSubview:self.rightButton];
}

- (void)setupConstraints
{
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(200);
        make.leading.offset(15);
        make.height.mas_equalTo(30);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.leftLabel.mas_trailing).offset(20);
        make.centerY.equalTo(self.leftLabel);
    }];
}

- (void)rightButtonAction
{
    self.commentModel.isOriginal = !self.commentModel.isOriginal;
    if (self.commentModel.isOriginal) {
        self.leftLabel.text = @"";
        [self.rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.leftLabel.mas_trailing);
        }];
    } else {
        self.leftLabel.text = @"Translated";
        [self.rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.leftLabel.mas_trailing).offset(20);
        }];
    }
    
//    [UIView animateWithDuration:0.25 animations:^{
//        [self.leftLabel.superview layoutIfNeeded];
//    }];
}


- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = UIColor.blackColor;
        _leftLabel.text = @"Translated";
    }
    return _leftLabel;
}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setTitle:@"Show Origin" forState:UIControlStateNormal];
        [_rightButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (MAS_CommentModel *)commentModel
{
    if (!_commentModel) {
        _commentModel = [[MAS_CommentModel alloc] init];
    }
    return _commentModel;
}


@end
