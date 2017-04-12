//
//  PPBaseTableViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/8.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseTableViewController.h"

@interface PPBaseTableViewController ()

@end

@implementation PPBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTableViewUI];
    
}
-(void)creatTableViewUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.tag = 333;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.textColor = PPRandomColor;
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *nextVCString = [NSString stringWithFormat:@"%@", self.vcs[indexPath.row]];
    UIViewController *nextVC =[NSClassFromString(nextVCString) new];
    nextVC.title = [NSString stringWithFormat:@"%@",self.titles[indexPath.row]];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
