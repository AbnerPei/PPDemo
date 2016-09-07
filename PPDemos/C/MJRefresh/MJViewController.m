//
//  MJViewController.m
//  MJDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  

#import "MJViewController.h"

#import "MJPicture.h"

@interface MJViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MJViewController
-(void)viewWillDisappear:(BOOL)animated
{
    isFirstCome = YES;
}
//一进来就让自动刷新
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    page = 0;
    isFirstCome = YES;
    isJuhua = NO;
    [self creatUI];
}
/**
 *  停止刷新
 */
-(void)endRefresh{
    
    if (page == 0) {
        [self.tableView.mj_header endRefreshing];
    }
    [self.tableView.mj_footer endRefreshing];
}
-(void)creatUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
      
}
-(void)getNetworkData:(BOOL)isRefresh
{
    if (isRefresh) {
        page = 0;
        isFirstCome = YES;
    }else{
         page++;
    }
    
    NSString *url;
    if (isFirstCome) {
        url = [NSString stringWithFormat:MissBaisiImageUrl,@"",page];
    }else{
        url = [NSString stringWithFormat:MissBaisiImageUrl,self.maxtime,page];
    }
//    [HYBNetworking cacheGetRequest:YES shoulCachePost:YES];
    [HYBNetworking getWithUrl:url refreshCache:NO params:nil progress:^(int64_t bytesRead, int64_t totalBytesRead) {
       
    } success:^(id response) {
        PPLog(@"请求成功---%@",response);
        [self endRefresh];
        isJuhua = NO; //数据获取成功后，设置为NO
        
        NSDictionary *dict = (NSDictionary *)response;
        NSDictionary *infoDict = [dict objectForKey:@"info"];
        totalPage = (int)[infoDict objectForKey:@"page"];
        self.maxtime = [infoDict objectForKey:@"maxtime"];
        
        if (page == 0) {
            [_pictures removeAllObjects];
        }
        //判断是否有菊花正在加载，如果有，判断当前页数是不是大于最大页数，是的话就不让加载，直接return；（因为下拉的当前页永远是最小的，所以直接return）
        if (isJuhua) {
            if (page >= totalPage) {
                [self endRefresh];
            }
            return ;
        }
        //没有菊花正在加载，所以设置yes
        isJuhua = YES;
        //显然下面的方法适用于上拉加载更多
        if (page >= totalPage) {
            [self endRefresh];
            return;
        }
        //获取模型数组
        NSArray *pictureArr = [dict objectForKey:@"list"];
        for (NSDictionary *dic in pictureArr) {
            MJPicture *picture = [[MJPicture alloc]init];
            [picture setValuesForKeysWithDictionary:dic];
            [self.pictures addObject:picture];
        }
        [self.tableView reloadData];
        //获取成功一次就判断
        isFirstCome = NO;
        
        
    } fail:^(NSError *error) {
        PPLog(@"请求失败---%@",error);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _pictures.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    MJPicture * picture = _pictures[indexPath.row];
    cell.textLabel.text = picture.name;
    cell.detailTextLabel.text = picture.passtime;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picture.profile_image]];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)pictures
{
    if (_pictures == nil) {
        _pictures = [NSMutableArray array];
    }
    return _pictures;
}

@end
