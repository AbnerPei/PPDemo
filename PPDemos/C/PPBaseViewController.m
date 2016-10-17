//
//  PPBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPBaseViewController.h"
#import "PPSets.h"
@interface PPBaseViewController ()

@end

@implementation PPBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"PPDemos";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.textColor = PPRandomColor;
    cell.textLabel.text = _titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, ScreenWidth, 1)];
    [cell.contentView addSubview:line];
    line.backgroundColor = [UIColor cyanColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *nextVCString = [NSString stringWithFormat:@"%@", _vcs[indexPath.row]];
    UIViewController *nextVC =[NSClassFromString(nextVCString) new];
    nextVC.title = [NSString stringWithFormat:@"%@",_titles[indexPath.row]];
    [self.navigationController pushViewController:nextVC animated:YES];
}
-(NSMutableArray *)vcs
{
    if (_vcs == nil) {
        _vcs = [NSMutableArray array];
    }
    return _vcs;
}
-(NSMutableArray *)titles
{
    if (_titles == nil) {
        _titles = [NSMutableArray array];
    }
    return _titles;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
