//
//  YYTextDemoViewController.m
//  PPDemos
//
//  Created by Abner on 16/9/12.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "YYTextDemoViewController.h"
#import "HYBNetworking.h"
#import <CoreLocation/CoreLocation.h>

#import "YYLabel+ConfigureFunction.h"

@interface YYTextDemoViewController ()<CLLocationManagerDelegate>
/*
 0. [专访YYKit作者郭曜源：开源大牛是怎样炼成的](http://www.infoq.com/cn/news/2015/11/ibireme-interview?utm_content=homepage)
 2. [YYKit之YYText](http://www.cnblogs.com/lujianwenance/p/5716804.html)
 3. [YYText 是如何绘制的](https://github.com/lzwjava/OpenSourceNotes/blob/master/YYText/YYText.md)
 4. [YYText 库学习总结](http://www.jianshu.com/p/60aee32ade55?nomobile=yes)
 6.
 */

{
    YYLabel *_topLB;
    YYLabel *_bottomLB;
    YYLabel *_messLB;
    CLLocationManager *_locationManager;
}
@end

@implementation YYTextDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testN];
    [self setupTopLB];
//    [self setupBottomLB];
    
    _messLB = [YYLabel new];
    _messLB.backgroundColor = [UIColor brownColor];
    _messLB.frame = CGRectMake(50, 260, 240, 200);
    _messLB.numberOfLines = 0;
    _messLB.textColor = [UIColor purpleColor];
    [self.view addSubview:_messLB];
    
 
    [self initializeLocationService];
    
    
}
- (void)initializeLocationService {
//    // 初始化定位管理器
//    _locationManager = [[CLLocationManager alloc] init];
//    // 设置代理
//    _locationManager.delegate = self;
//    // 设置定位精确度到米
//    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    // 设置过滤器为无
//    _locationManager.distanceFilter = kCLDistanceFilterNone;
//    // 开始定位
//    [_locationManager startUpdatingLocation];
    
    // 初始化定位管理器
    _locationManager = [[CLLocationManager alloc] init];
    // 设置代理
    _locationManager.delegate = self;
    // 设置定位精确度到米
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 设置过滤器为无
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    // 开始定位
    // 取得定位权限，有两个方法，取决于你的定位使用情况
    // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
    [_locationManager requestAlwaysAuthorization];//这句话ios8以上版本使用。
    [_locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //将经度显示到label上
    _topLB.text = [NSString stringWithFormat:@"经度 %lf", newLocation.coordinate.longitude];
    //将纬度现实到label上
    _bottomLB.text = [NSString stringWithFormat:@"纬度 %lf", newLocation.coordinate.latitude];
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLFloor *floor = location.floor;
            
            NSLog(@"位置：%@",placemark.name);
            NSLog(@"国家：%@",placemark.country);
            NSLog(@"城市：%@",placemark.locality);
            NSLog(@"区：%@",placemark.subLocality);
            NSLog(@"街道：%@",placemark.thoroughfare);
            NSLog(@"子街道：%@",placemark.subThoroughfare);
            NSLog(@"areasOfInterest：%@",placemark.areasOfInterest);
            NSLog(@"floor:%ld",floor.level);

            //将获得的所有信息显示到label上
            _messLB.text = placemark.name;
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            NSLog(@"city = %@---%@", city,placemark.administrativeArea);
//            _cityLable.text = city;
//            [_cityButton setTitle:city forState:UIControlStateNormal];
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}
-(void)testN
{
   
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@10 forKey:@"type"];
    [param setValue:@"{}" forKey:@"gson"];
    [manager POST:@"http://hao.oudot.cn/tongji_app/JsonManageServlet?" parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *retBodyDict = [resultDict objectForKey:@"retBody"];
        NSArray *businessListArr = [retBodyDict objectForKey:@"businessList"];
        NSDictionary *messDict = businessListArr[0];
        NSString *infoStr = [messDict objectForKey:@"businessInfo"];
        
        NSLog(@"infoStr is --- %@",infoStr);
        
#warning 把请求的数据放到这里，就可以实现换行，why??
#warning 把请求的数据放到这里，就可以实现换行，why??
#warning 把请求的数据放到这里，就可以实现换行，why??
        
        //        infoStr = @"我应该是一个详情。我应该\n\n是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一个详情。我应该是一\n\n个详情。我应该是一个详情。";
        NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc]initWithString:infoStr];
        _messLB.attributedText = mutStr;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
-(void)setupTopLB
{
    YYLabel *topLB = [YYLabel new];
    _topLB = topLB;
    topLB.text = @"山上轻松山上花，\n花间轻松不如她。\n有朝一日山开花，\n上京花园人满山。";
    [self.view addSubview:topLB];
    topLB.frame = CGRectMake(50, 100, ScreenWidth-100, 180);
    topLB.textAlignment = NSTextAlignmentCenter;
    //如果有换行符“\n”，记得设置numberOfLines为0；
    topLB.numberOfLines = 0;
    topLB.backgroundColor = [UIColor whiteColor];
    
//    NSArray *arr = [self applyStylesToText:topLB.text pattern:@"山"];
//    NSArray *arr1 = [self applyStylesToText:topLB.text pattern:@"花"];
    
//    NSLog(@"arr- %@--arr1- %@",arr,arr1);
    
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc]initWithString:topLB.text];
//    mutStr.yy_color = [UIColor pp_greenColor];
//
//    for (NSTextCheckingResult *result in arr) {
//        [mutStr yy_setColor:[UIColor pp_violetColor] range:result.range];
//    }
//    for (NSTextCheckingResult *result in arr1) {
//        [mutStr yy_setColor:[UIColor pp_magentaColor] range:result.range];
//    }
//    topLB.attributedText = mutStr;
//    
//    BOOL contains = [mutStr.string containsString:@"山"];
//    BOOL contains1 = [mutStr.string containsString:@"花9"];
//    NSLog(@"%d---%d",contains,contains1);
    
    [_topLB LBAttributedTextWithTextColor:[UIColor pp_purpleColor] font:[UIFont systemFontOfSize:16] specialTextColorArray:@[[UIColor pp_redColor],[UIColor pp_blueColor]] specialTextFontArray:@[[UIFont systemFontOfSize:12],[UIFont systemFontOfSize:20],[UIFont systemFontOfSize:18]] specialTextArray:@[@"山",@"松",@"花"] attributedStr:mutStr];
    

    
}
-(void)btnAction
{
    NSLog(@"btnAction");
}
- (NSArray *)applyStylesToText:(NSString *)text pattern:(NSString *)pattern
{
    NSMutableArray *arrya = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(1, 3);
    NSRange paragaphRange = [text paragraphRangeForRange: searchRange];
    
    NSRegularExpression *regex = [self expressionForDefinitionWithPattern:pattern];
    
    [regex enumerateMatchesInString:text options:0 range:paragaphRange
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             [arrya addObject:result];
                         }];
    return arrya;
}


- (NSRegularExpression *)expressionForDefinitionWithPattern:(NSString *)pattern
{
    NSRegularExpression *expression = nil;
    expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                           options:NSRegularExpressionCaseInsensitive error:nil];
    
    return expression;
}


-(void)setupBottomLB
{
    YYLabel *bottomLB = [YYLabel new];
    _bottomLB = bottomLB;
    bottomLB.text = @"有朝一日寒风雨，\n只见青松不见花。";
    NSMutableAttributedString *mutStr = [[NSMutableAttributedString alloc]initWithString:bottomLB.text];
    CGSize introSize = CGSizeMake(ScreenWidth-100, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:mutStr];
    bottomLB.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    CGFloat introWidth = layout.textBoundingSize.width;
//    bottomLB.attributedText = mutStr;
    [self.view addSubview:bottomLB];
    bottomLB.frame = CGRectMake(50, 200, introWidth, introHeight);
    bottomLB.backgroundColor = [UIColor lightGrayColor];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
