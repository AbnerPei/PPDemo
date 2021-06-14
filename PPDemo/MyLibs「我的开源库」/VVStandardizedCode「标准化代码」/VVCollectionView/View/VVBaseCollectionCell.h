//
//  VVBaseCollectionCell.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import <UIKit/UIKit.h>
#import "VVCollectionCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseCollectionCell : UICollectionViewCell <VVCollectionCellProtocol>

#warning pp605
/// <#注释#>
@property (nonatomic, strong) __kindof NSObject *viewModel;

@end

NS_ASSUME_NONNULL_END
