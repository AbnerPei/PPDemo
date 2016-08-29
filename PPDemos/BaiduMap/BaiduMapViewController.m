//
//  BaiduMapViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "BaiduMapViewController.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

@interface BaiduMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BMKLocationService *_locService;
    BMKGeoCodeSearch *_searcher;
}
/** 地图view */
@property(nonatomic,strong)BMKMapView *mapView;
/** 主地址数组 */
@property(nonatomic,strong)NSMutableArray *mainAddresses;
/** 副地址数组 */
@property(nonatomic,strong)NSMutableArray *subAddresses;
/** 底部tableview */
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"百度地图使用";
    [self setupMapLocation];
    
}
-(void)setupMapLocation
{
    _locService = [[BMKLocationService alloc]init];
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*3/7)];
    [self.view addSubview:_mapView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenHeight*3/7, ScreenWidth, ScreenHeight*4/7) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];

    _mainAddresses = [NSMutableArray array];
    _subAddresses = [NSMutableArray array];


}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
    //开始定位
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
   
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
//    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    //展示定位
    self.mapView.showsUserLocation = YES;//是否显示定位小蓝点，no不显示，我们下面要自定义的(这里显示前提要遵循代理方法，不可缺少)
    //更新位置数据
    [self.mapView updateLocationData:userLocation];
    
    //获取用户的坐标
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
    self.mapView.zoomLevel =16;//地图等级，数字越大越清晰
    
    //发起反向地理编码检索
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    //反地理编码出地理位置
    CLLocationCoordinate2D pt =(CLLocationCoordinate2D){0,0};
    pt = (CLLocationCoordinate2D){userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude};
    
    BMKReverseGeoCodeOption *reverseGeoCodeOption = [[BMKReverseGeoCodeOption alloc] init];
    reverseGeoCodeOption.reverseGeoPoint = pt;
    //发送反编码请求.并返回是否成功
    BOOL flag = [_searcher reverseGeoCode:reverseGeoCodeOption];
    
    if (flag) {
        NSLog(@"反geo检索发送成功");
    } else {
        NSLog(@"反geo检索发送失败");
    }
    
//    [_locService stopUserLocationService];
//    _mapView.showsUserLocation = NO;


}
// 反地理编码
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    
    if (error == 0) {
        for (BMKPoiInfo *poiInfo in result.poiList) {
            NSLog(@"888---%@-----%@",poiInfo.name,poiInfo.address);
            [_mainAddresses addObject:poiInfo.name];
            [_subAddresses addObject:poiInfo.address];
        }
        [_tableView reloadData];
    }
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mainAddresses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _mainAddresses[indexPath.row];
    cell.detailTextLabel.text = _subAddresses[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
