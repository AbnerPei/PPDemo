//
//  PPBaseTableViewController.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseViewController.h"

@interface PPBaseTableViewController : PPBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableArray *vcs;

@end
