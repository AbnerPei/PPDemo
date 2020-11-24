//
//  BaseTableViewController.h
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *titles;

@property (nonatomic, copy) NSArray *vcs;

@end

NS_ASSUME_NONNULL_END
