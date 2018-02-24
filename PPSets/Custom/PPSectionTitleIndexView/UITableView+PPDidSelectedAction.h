//
//  UITableView+PPDidSelectedAction.h
//  ZMBCY
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 Brance. All rights reserved.
//
typedef void(^PPTableViewDidSelectedBlcok)(UITableView *tableView,NSIndexPath *indexPath);

#import <UIKit/UIKit.h>

// tableView点击方法通知名字，无用，暂时留着，配合.m里面的注释看。
// UIKIT_EXTERN NSString *const PPTableViewDidSelectedNotificationKey;

@interface UITableView (PPDidSelectedAction)
/** 给tableView绑定didSelected点击block回调 */
@property(nonatomic,copy)PPTableViewDidSelectedBlcok pp_didSelectedBlock;
@end
