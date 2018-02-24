//
//  PPSectionTitleIndexDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/19.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPSectionTitleIndexDemoViewController.h"
#import "PPSectionTitleIndexView.h"
#import "PPSectionTitleIndexDemo2ViewController.h"

static NSString *PPIdentifier = @"ppReuseIdentifier";

@interface PPSectionTitleIndexDemoViewController ()<PPSectionTitleIndexViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_indexPathArr;
    NSArray *_indexTitles;
    UITableView *_tableView;
}

@end

@implementation PPSectionTitleIndexDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _indexPathArr = [@[
                       @0,
                       @4,
                       @7
                       ] mutableCopy];
    _indexTitles = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"W",@"X",@"Y",@"Z"];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PPIdentifier];
    
    
    PPSectionTitleIndexView *indexV = [[PPSectionTitleIndexView alloc]initWithFrame:CGRectMake(_tableView.frame.origin.x+_tableView.frame.size.width-40, _tableView.frame.origin.y, 40, _tableView.frame.size.height) delegate:self];
    [self.view addSubview:indexV];
    
}
-(UITableView *)sectionTitleIndexViewAssociatedView
{
    return _tableView;
}
-(NSArray<NSString *> *)sectionTitleIndexViewSectionTitles
{
    return _indexTitles;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _indexTitles.count;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    v.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    
    UILabel *aLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, [UIScreen mainScreen].bounds.size.width, 20)];
    aLB.text = _indexTitles[section];
    aLB.textColor = [UIColor purpleColor];
    [v addSubview:aLB];
    
    return v;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PPIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PPIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"section %ld--row %ld",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
    
    PPSectionTitleIndexDemo2ViewController *mine2VC = [[PPSectionTitleIndexDemo2ViewController alloc]init];
    [self.navigationController pushViewController:mine2VC animated:YES];
    
}

@end
