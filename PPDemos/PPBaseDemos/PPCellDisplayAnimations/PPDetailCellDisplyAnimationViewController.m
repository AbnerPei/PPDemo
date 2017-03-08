//
//  PPDetailCellDisplyAnimationViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPDetailCellDisplyAnimationViewController.h"

@interface PPDetailCellDisplyAnimationViewController ()
{
    BOOL _isNeededAnimation;  //判断当前cell要不要做动画效果
    int  _baseCount;
}
@end

@implementation PPDetailCellDisplyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatRightItemUI];
    self.titles = [NSMutableArray array];
    
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
    [self.tableView reloadData];
    
    _isNeededAnimation = NO;
    
    //模拟网路加载数据
    _baseCount+=100;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
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
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isNeededAnimation == NO) {
        CGFloat rowHeight = [self tableView:tableView heightForRowAtIndexPath:indexPath];
        CGFloat displayRowFloat = tableView.height/rowHeight;
        NSInteger rowCount = [[JRNumberTool jr_Ceilf:[NSString stringWithFormat:@"%f",displayRowFloat] decimalCount:0] integerValue];
        NSLog(@"indexPath.row---%ld----%f",indexPath.row,rowHeight);
        if (indexPath.row+1 <= rowCount) {
            CGRect originFrame = cell.frame;
            CGRect frame = cell.frame;
            frame.origin.y = originFrame.origin.y+60;
            cell.frame = frame;
            
            NSTimeInterval duration = 0.3;
            
            cell.alpha = 0;
            [UIView animateWithDuration:0.1 delay:duration*(indexPath.row) options:UIViewAnimationOptionCurveLinear animations:^{
                cell.alpha = 1.0;
            } completion:nil];
            
            [UIView animateWithDuration:duration delay:duration*(indexPath.row) options:UIViewAnimationOptionCurveLinear animations:^{
                cell.frame = originFrame;
            } completion:^(BOOL finished) {
                if (finished) {
                    if (indexPath.row+1 >= rowCount) {
                        _isNeededAnimation = YES;
                    }
                }
            }];
            
        }
    }
}


@end
