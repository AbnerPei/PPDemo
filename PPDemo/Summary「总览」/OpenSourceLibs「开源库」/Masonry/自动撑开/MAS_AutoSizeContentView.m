//
//  MAS_AutoSizeContentView.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/20.
//

#import "MAS_AutoSizeContentView.h"
#import <Masonry/Masonry.h>

@implementation MAS_AutoSizeContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.lightGrayColor;
        [self addSubview:self.commentLabel];
        
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.leading.mas_equalTo(15);
            make.trailing.mas_equalTo(-15);
            make.bottom.mas_equalTo(-10);
        }];
        
    }
    return self;
}

- (UILabel *)commentLabel
{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.numberOfLines = 0;
    }
    return _commentLabel;
}

@end
