//
//  PPFirstViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/24.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPFirstViewController.h"

@interface PPFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableArray *vcs;
@end

@implementation PPFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.tag = 333;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"MJRefrsh使用Demos",
                     @"MJExtension使用Demos",
                     @"Masonry使用Demos",
                     @"JavaScriptCore使用",
                     @"Animation Demos",
                     @"Runtime学习",
                     @"YYText使用demos",
                     @"自定义PPTextfield,各种限制一句话搞定",
                     @"人脸识别（uiimageview+faceaware）",
                     @"日历中添加事件 和 拨打电话常用方式",
                     @"Runtime学习",
                     @"YYText使用demos",
                     @"自定义PPTextfield,各种限制一句话搞定",
                     @"人脸识别（uiimageview+faceaware）",
                     @"日历中添加事件 和 拨打电话常用方式"
                     ] mutableCopy];
    
    self.vcs = [@[
                  
                  @"MJBaseViewController",
                  @"MJExtensionBaseViewController",
                  @"MasonryBaseViewController",
                  @"JSViewController",
                  @"AnimationBaseViewController",
                  @"RuntimeViewController",
                  @"YYTextDemoViewController",
                  @"PPTextfieldViewController",
                  @"PPFaceAwareFillViewController",
                  @"CalendarEventViewController",
                  @"RuntimeViewController",
                  @"YYTextDemoViewController",
                  @"PPTextfieldViewController",
                  @"PPFaceAwareFillViewController",
                  @"CalendarEventViewController"

                  ] mutableCopy];
    
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
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, ScreenWidth, 1)];
    [cell.contentView addSubview:line];
    line.backgroundColor = [UIColor cyanColor];
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


@end
