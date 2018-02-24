//
//  PPDetailCellDisplyAnimationViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPDetailCellDisplyAnimationViewController.h"
//#import "UITableViewCell+ShowAnimations.h"

@interface PPDetailCellDisplyAnimationViewController ()
{
    BOOL _isNeededAnimation;  //判断当前cell要不要做动画效果
    int  _baseCount;
}
//cell动画indexPath集合
@property(nonatomic,strong)NSMutableSet *cellAnimationIndexPaths;
@end

@implementation PPDetailCellDisplyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatRightItemUI];
    self.titles = [NSMutableArray array];
    self.cellAnimationIndexPaths = [NSMutableSet set];
    
    [self refreshDataAction];
}
-(void)creatRightItemUI
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshDataAction)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)refreshDataAction
{
    
    [self.titles removeAllObjects];
    [self.cellAnimationIndexPaths removeAllObjects];
    [self.tableView reloadData];
    
    _isNeededAnimation = NO;
    
    //模拟网路加载数据
    _baseCount+=100;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = _baseCount; i<_baseCount+30; i++) {
            [self.titles addObject:[NSString stringWithFormat:@"%d",i]];
        }
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor blueColor];
    
    if (![self.cellAnimationIndexPaths containsObject:indexPath]) {
        [self.cellAnimationIndexPaths addObject:indexPath];
        CGFloat rowHeight = [self tableView:tableView heightForRowAtIndexPath:indexPath];
#warning pp605 img start
//        [cell pp_showAnimationWithAnimationStyle:UITableViewCellShowAnimationStyleBottomTop cellHeight:rowHeight tableView:tableView indexPath:indexPath];
#warning pp605 img start

    }
}


@end
