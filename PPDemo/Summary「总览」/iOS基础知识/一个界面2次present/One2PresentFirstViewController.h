//
//  One2PresentFirstViewController.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/10.
//

#import <UIKit/UIKit.h>
typedef void(^didTappedBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface One2PresentFirstViewController : UIViewController

@property (nonatomic, copy)didTappedBlock block;

@end

NS_ASSUME_NONNULL_END
