//
//  MAS_AutoSizeViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/20.
//

#import "MAS_AutoSizeViewController.h"
#import "MAS_AutoSizeContentView.h"
#import <Masonry/Masonry.h>

@interface MAS_AutoSizeViewController ()
@property (nonatomic, strong) MAS_AutoSizeContentView *autoSizeContentView;
@property (nonatomic, assign) BOOL hasClicked;
@end

@implementation MAS_AutoSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.autoSizeContentView];
    
    [self.autoSizeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.top.mas_equalTo(100);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_hasClicked) {
        self.autoSizeContentView.commentLabel.text = @"①山上";
    } else {
        self.autoSizeContentView.commentLabel.text = @"①山上青松山上花,花间青松不如她,有朝一日寒风雨,只见青松不见花.②山上青松山上花,花间青松不如她,有朝一日寒风雨,只见青松不见花.";
    }
    
    _hasClicked = !_hasClicked;
    
}

- (MAS_AutoSizeContentView *)autoSizeContentView
{
    if (!_autoSizeContentView) {
        _autoSizeContentView = [[MAS_AutoSizeContentView alloc] init];
    }
    return _autoSizeContentView;
}

@end
