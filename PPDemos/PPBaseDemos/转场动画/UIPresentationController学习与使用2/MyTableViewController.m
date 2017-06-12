//
//  MyTableViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyCustomCell.h"

@interface MyTableViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSInteger _selectedIndex;
    UITableView *_tableView;
}

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _selectedIndex = -1;
    
    //可以根据需求封装任意大小的view
    UITableView *tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  300)];
    _tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [self tableViewHeaderView];
    
    
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view.
}


-(UIView *)tableViewHeaderView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 45)];
    view.backgroundColor = [UIColor yellowColor];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"修改优惠";
    titleLabel.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1.0];
    titleLabel.font = [UIFont  systemFontOfSize:14.0f];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.frame = CGRectMake(view.frame.origin.x+15, view.frame.origin.y +10, 60, 30);
    
    [view addSubview:titleLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor pp_violetColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(ScreenWidth-80, 0, 80, 45);
    [view addSubview:button];
    
    return view;
    
    
    
}


//x按钮：点击x按钮时，弹出界面消失
- (void)btnAction: (UIButton *)sender
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
    
    
}


#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCustomCell *cell = [MyCustomCell cellWithTableView:tableView];
    BOOL isSelected = _selectedIndex == indexPath.row ? YES:NO;
    [cell setupMyCustomCell:indexPath.row isSelected:isSelected];
    
    return cell;
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 45;
}


/**
 *  确保每次只选中一个cell（用NSIndexPath记录下上一次点击的cell,并用字典记录下这个cell对应的状态，点击新的cell时将新的cell的图片改为选中状态并用字典记录下对应的状态，将上一次的cell的图片改为非选中状态同时还是用字典记录下对应的状态）
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedIndex = indexPath.row;
    [_tableView reloadData];
    
}



@end
