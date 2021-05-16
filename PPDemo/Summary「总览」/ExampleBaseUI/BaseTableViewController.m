//
//  BaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTableViewUI];
    
}
- (void)createTableViewUI
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self cellMakeWithTableView:tableView];
    cell.textLabel.textColor = UIColor.blackColor;
    cell.textLabel.text = self.titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UITableViewCell *)cellMakeWithTableView:(UITableView *)tableView
{

    NSString * identifier = [NSString stringWithFormat:@"%@Identifier",NSStringFromClass([UITableViewCell class])];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.vcs.count == 0) {
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *nextVC = nil;
    if ([self.vcs[indexPath.row] isKindOfClass:[UIViewController class]]) {
        nextVC = self.vcs[indexPath.row];
    }else{
        NSString *nextVCString = [NSString stringWithFormat:@"%@", self.vcs[indexPath.row]];
        nextVC =[NSClassFromString(nextVCString) new];
    }
    
    nextVC.view.backgroundColor = UIColor.whiteColor;
    nextVC.title = [NSString stringWithFormat:@"%@",self.titles[indexPath.row]];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
