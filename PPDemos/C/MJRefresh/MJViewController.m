//
//  MJViewController.m
//  MJDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  

#import "MJViewController.h"

#import "MJPicture.h"
#import "MJRefreshCell.h"
#import "PPBaiSiRequest.h"

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
//        url = [NSString stringWithFormat:MissBaisiImageUrl,@"",page];
        self.maxtime = @"";
    }
//    else{
//        url = [NSString stringWithFormat:MissBaisiImageUrl,self.maxtime,page];
//    }
    PPBaiSiRequest *request = [[PPBaiSiRequest alloc]initWithCategoryType:PPMissBaiSiCategoryTypePicture maxtime:self.maxtime currentPage:page perPageCount:20];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        PPLog(@"success--%@---responseJSONObject--%@--responseObject-%@---%@",request,request.responseJSONObject,request.responseObject,[NSThread currentThread]);
        [self endRefresh];
        isJuhua = NO; //数据获取成功后，设置为NO
        
        NSDictionary *dict = (NSDictionary *)request.responseObject;
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
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        PPLog(@"请求失败---%@",request.error);
        [self endRefresh];
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _pictures.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //方法1：这样的话会导致app第一次安装的时候缓存不到图片
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    MJPicture * picture;
//    if (_pictures.count > indexPath.row) {
//        picture = _pictures[indexPath.row];
//        cell.textLabel.text = picture.name;
//        cell.detailTextLabel.text = picture.passtime;
//        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picture.profile_image]];
//    }
//    return cell;
    
    //方法2：这种方法就可以第一次装的时候缓存到图片
    MJRefreshCell *cell = [MJRefreshCell cellWithTableView:tableView];
    MJPicture * picture;
    if (_pictures.count > indexPath.row) {
        picture = _pictures[indexPath.row];
        [cell setupMJRefreshCellData:picture];
    }
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
