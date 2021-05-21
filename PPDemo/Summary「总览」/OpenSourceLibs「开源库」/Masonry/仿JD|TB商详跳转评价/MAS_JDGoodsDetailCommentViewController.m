//
//  MAS_JDGoodsDetailCommentViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import "MAS_JDGoodsDetailCommentViewController.h"
#import "MAS_JDGoodsDetailContainerView.h"
#import <Masonry/Masonry.h>

@interface MAS_JDGoodsDetailCommentViewController ()

@property (nonatomic, strong) MAS_JDGoodsDetailContainerView *goodsDetailContainerView;

@end

@implementation MAS_JDGoodsDetailCommentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.goodsDetailContainerView];
    [self.goodsDetailContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


- (MAS_JDGoodsDetailContainerView *)goodsDetailContainerView
{
    if (!_goodsDetailContainerView) {
        _goodsDetailContainerView = [[MAS_JDGoodsDetailContainerView alloc] init];
    }
    return _goodsDetailContainerView;
}

@end
