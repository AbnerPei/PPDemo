//
//  VVBaseCollectionReusableView.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import <UIKit/UIKit.h>
#import "VVCollectionReusableViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseCollectionReusableView : UICollectionReusableView <VVCollectionReusableViewProtocol>

#warning pp605
/// <#注释#>
@property (nonatomic, strong) __kindof NSObject *viewModel;

@end

NS_ASSUME_NONNULL_END
