//
//  VVBaseCollectionReusableView.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import "VVBaseCollectionReusableView.h"

@implementation VVBaseCollectionReusableView
#warning pp605
//@synthesize vv_model;
@dynamic viewModel;

// !!!: VVCollectionReusableViewProtocol
+ (NSString *)kind
{
    return UICollectionElementKindSectionHeader;
}

+ (CGSize)headerSizeWithModel:(id)model
{
    return CGSizeZero;
}

// !!!: VVReuseViewProtocol
+ (NSString *)identifier
{
    return [NSString stringWithFormat:@"k_%@_identifier", NSStringFromClass(self)];
}

// !!!: life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self executeMethodsOfViewProtocols];
    }
    return self;
}

- (void)dealloc
{
    [self view_removeObservers];
}

// !!!: private method
- (void)executeMethodsOfViewProtocols
{
    [self setupUI];
    [self setupConstraints];
    [self bindUIActions];
    [self view_addObservers];
}

- (void)setupUI
{
    
}

- (void)setupConstraints
{
    
}

- (void)bindUIActions
{
    
}

- (void)view_addObservers
{
    
}

- (void)view_removeObservers
{
    
}

- (void)addReuseViewModelObservers
{
    
}

- (void)removeReuseViewModelObservers
{
    
}

- (void)updateWithModel:(id)model
{
    
}

@end
