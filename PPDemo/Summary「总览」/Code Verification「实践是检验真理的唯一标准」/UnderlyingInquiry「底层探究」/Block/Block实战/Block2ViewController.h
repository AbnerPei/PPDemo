//
//  Block2ViewController.h
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Block2ViewController : UIViewController

@property (nonatomic, copy) void(^didChangedTitleBlock)(NSString *title);

@end

NS_ASSUME_NONNULL_END
