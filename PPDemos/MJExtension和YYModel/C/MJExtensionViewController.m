//
//  MJExtensionViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJExtensionViewController.h"
#import "MJExtension.h"
#import "YYModel.h"
#import "User.h"
#import "Status.h"
#import "Ad.h"
#import "StatusResult.h"
#import "Student.h"
#import "Bag.h"


@interface MJExtensionViewController ()
{
    NSDictionary *dict_user; //简单的（user）字典
    NSString *jsonStr;
    NSDictionary *dict_m8m; //复杂的（model里面包含model）字典
    NSDictionary *dict_m8a; //模型中有个数组属性，数组里面又要装着其他模型的字典
    NSDictionary *dict_nokey;
}
@end

@implementation MJExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"模型转换demos";
    [self setupDatas];
    [self setupDatas_MJ];
    
//    //1.简单的字典 --> 模型 [8---by,2---to]
//    //mj，使用的是mj_objectWithKeyValues:方法
//    //yy，使用的是yy_modelWithDictionary:方法
//    [self dict2model_mj];
//    [self dict2model_yy];
    
//    //2. JSON字符串 --> 模型
//    //mj，使用的是mj_objectWithKeyValues:方法
//    //yy，使用的是yy_modelWithJSON:方法
//    [self json2model_mj];
//    [self json2model_yy];
    
//    //3. 复杂的字典 --> 模型 (模型里面包含了模型)
//    //mj，使用的是mj_objectWithKeyValues:方法 [点语法调用]
//    //yy，使用的是yy_modelWithDictionary:方法
//    [self dict82model_mj];
//    [self dict82model_yy];
    
    /*总结一：1.字典转模型，无论是mj还是yy，也不管是简单字典还是复杂字典，方法都是mj_objectWithKeyValues和yy_modelWithDictionary；
             2.JSON转模型，mj还是mj_objectWithKeyValues，而yy用的yy_modelWithJSON；
     */
    
    
//    //4.模型中有个数组属性，数组里面又要装着其他模型
//    
//    /*
//     //4.1 MJ
//     【重点，核心】》》数组中存储模型数据，需要说明数组中存储的模型数据类型 《《
//
//     // Tell MJExtension what type model will be contained in statuses and ads.
//     
//     [StatusResult mj_setupObjectClassInArray:^NSDictionary *{
//                 return @{
//                             @"statuses" : @"Status",
//                             // @"statuses" : [Status class],
//                             @"ads" : @"Ad"
//                             // @"ads" : [Ad class]
//                         };
//     }];
//     // Equals: StatusResult.m implements +mj_objectClassInArray method.
//     
//     //4.2 YY
//     【重点，核心】 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
//     + (NSDictionary *)modelContainerPropertyGenericClass {
//                 return @{
//                           @"shadows" : [Shadow class],
//                           @"borders" : Border.class,
//                           @"attachments" : @"Attachment" };
//     }
//     
//     */
//    [self dict882model_mj];
//    [self dict882model_yy];
    
    //从5开始就只用MJ，如果YY可以的话，我会再修改，暂时只研究MJ
    //5.模型中的属性名和字典中的key不相同(或者需要多级映射)
    //多级映射，用点语法设置
    [self setupNoKeyOrMore];
    
    //6.字典数组 --> 模型数组
    //mj_objectArrayWithKeyValuesArray:
    [self dictArray2modelArray];
    
    //7.模型 --> 字典
    //mj_keyValues
    [self model2dict];
    
    //8. 模型数组 --> 字典数组
    //mj_keyValuesArrayWithObjectArray
    [self modelArray2dictArray];
    
    //9.过滤字典的值
    //以后。。。
    
}

-(void)modelArray2dictArray
{
    //创建模型数组
    User *user1 = [[User alloc] init];
    user1.name = @"Jack";
    user1.icon = @"lufy.png";
    User *user2 = [[User alloc] init];
    user2.name = @"Rose";
    user2.icon = @"nami.png";
    NSArray *userArray = @[user1, user2];
    //模型数组转字典数组，使用的是mj_keyValuesArrayWithObjectArray:方法
    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];
    NSLog(@"%@", dictArray);
    /*
     (
     {
     icon = "lufy.png";
     name = Jack;
     },
     {
     icon = "nami.png";
     name = Rose;
     }
     )
     */
}
-(void)model2dict
{
    User *user = [[User alloc] init];
    user.name = @"Jack";
    user.icon = @"lufy.png";
    
    Status *status = [[Status alloc] init];
    status.user = user;
    status.text = @"Nice mood!";
    
    //模型转字典，使用的是mj_keyValues属性
    NSDictionary *statusDict = status.mj_keyValues;
    NSLog(@"%@", statusDict);
    /*
     {
     text = "Nice mood!";
     user =     {
     icon = "lufy.png";
     name = Jack;
     };
     }
     */
}


-(void)dictArray2modelArray
{
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png"
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png"
                               }
                           ];
    //字典数组转模型数组，使用的是mj_objectArrayWithKeyValuesArray:方法
    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];
    //打印
    for (User *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
    // name=Jack, icon=lufy.png
    // name=Rose, icon=nami.png
}


-(void)setupNoKeyOrMore
{
//    // How to map
//    [Student mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{
//                 @"ID" : @"id",
//                 @"desc" : @"desciption",
//                 @"oldName" : @"name.oldName",
//                 @"nowName" : @"name.newName",
//                 @"nameChangedTime" : @"name.info[1].nameChangedTime",
//                 @"bag" : @"other.bag"
//                 };
//    }];
//    // Equals: Student.m implements +mj_replacedKeyFromPropertyName method.
    
    //字典转模型，支持多级映射
    Student *stu = [Student mj_objectWithKeyValues:dict_nokey];
    //打印
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
          stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    NSLog(@"bagName=%@, bagPrice=%f", stu.bag.name, stu.bag.price);
    
    //2016-07-04 14:20:28.082 PPDemos[3602:126004] ID=20, desc=kids, oldName=kitty, nowName=lufy, nameChangedTime=2013-08
    //2016-07-04 14:20:28.082 PPDemos[3602:126004] bagName=a red bag, bagPrice=100.700000
}


#pragma mark --4- 使用MJExtension实现“模型中有个数组属性，数组里面又要装着其他模型”转“模型”
-(void)dict882model_mj
{
    [StatusResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{
//                 @"statuses" : @"Status",
                  @"statuses" : [Status class],
//                 @"ads" : @"Ad"
                  @"ads" : [Ad class]
                 };
    }];
    //字典转模型，支持模型的数组属性里面又装着模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dict_m8a];
    //打印博主信息
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"mj---text=%@, name=%@, icon=%@", text, name, icon);
    }
    //打印广告
    for (Ad *ad in result.ads) {
        NSLog(@"mj---image=%@, url=%@", ad.image, ad.url);
    }
}
-(void)dict882model_yy
{
    //字典转模型，支持模型的数组属性里面又装着模型
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dict_m8a];
    //打印博主信息
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"yy---text=%@, name=%@, icon=%@", text, name, icon);
    }
    //打印广告
    for (Ad *ad in result.ads) {
        NSLog(@"yy---image=%@, url=%@", ad.image, ad.url);
    }
    
    /*
     2016-07-04 13:47:58.994 PPDemos[3353:113055] mj---text=Nice weather!, name=Rose, icon=nami.png
     2016-07-04 13:47:58.995 PPDemos[3353:113055] mj---text=Go camping tomorrow!, name=Jack, icon=lufy.png
     2016-07-04 13:47:58.995 PPDemos[3353:113055] mj---image=ad01.png, url=http://www.ad01.com
     2016-07-04 13:47:58.995 PPDemos[3353:113055] mj---image=ad02.png, url=http://www.ad02.com
     
     2016-07-04 13:47:58.996 PPDemos[3353:113055] yy---text=Nice weather!, name=Rose, icon=nami.png
     2016-07-04 13:47:58.996 PPDemos[3353:113055] yy---text=Go camping tomorrow!, name=Jack, icon=lufy.png
     2016-07-04 13:47:58.996 PPDemos[3353:113055] yy---image=ad01.png, url=http://www.ad01.com
     2016-07-04 13:47:58.997 PPDemos[3353:113055] yy---image=ad02.png, url=http://www.ad02.com
     */

}


#pragma mark --3- 使用MJExtension实现“复杂的字典”转“模型”
-(void)dict82model_mj
{
    //字典转模型，模型里面含有模型
    Status *status = [Status mj_objectWithKeyValues:dict_m8m];
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"mj-----text=%@, name=%@, icon=%@", text, name, icon);
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"mj-----text2=%@, name2=%@, icon2=%@", text2, name2, icon2);

}
#pragma mark --3- 使用YYModel实现“复杂的字典”转“模型”
-(void)dict82model_yy
{
    //字典转模型，模型里面含有模型
    Status *status = [Status yy_modelWithDictionary:dict_m8m];
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"yy-----text=%@, name=%@, icon=%@", text, name, icon);
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"yy-----text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    //打印结果
    //2016-07-04 11:45:39.675 PPDemos[2781:87089] mj-----text=Agree!Nice weather!, name=Jack, icon=lufy.png
    //2016-07-04 11:45:39.675 PPDemos[2781:87089] mj-----text2=Nice weather!, name2=Rose, icon2=nami.png
    //2016-07-04 11:45:39.678 PPDemos[2781:87089] yy-----text=Agree!Nice weather!, name=Jack, icon=lufy.png
    //2016-07-04 11:45:39.678 PPDemos[2781:87089] yy-----text2=Nice weather!, name2=Rose, icon2=nami.png
}


#pragma mark --2- 使用MJExtension实现“json”转“模型”
-(void)json2model_mj
{
    User *user = [User mj_objectWithKeyValues:jsonStr];
    NSLog(@"MJ---%@----%@---%u",user.name,user.icon,user.age);
}
#pragma mark --2- 使用YYModel实现“json”转“模型”
-(void)json2model_yy
{
    User *user = [User yy_modelWithJSON:jsonStr];
    NSLog(@"YY---%@----%@---%u",user.name,user.icon,user.age);
    //打印结果
    //2016-07-04 11:16:04.655 PPDemos[2563:78561] MJ---Jack----lufy.png---20
    //2016-07-04 11:16:04.698 PPDemos[2563:78561] YY---Jack----lufy.png---20
}


#pragma mark --1- 使用MJExtension实现“字典”转“模型”
-(void)dict2model_mj
{
    User *user = [User mj_objectWithKeyValues:dict_user];
    NSLog(@"MJ---%@----%@---%u---%@---%@---%u----%d",user.name,user.icon,user.age,user.height,user.money,user.sex,user.gay);
}
#pragma mark --1- 使用YYModel实现“字典”转“模型”
-(void)dict2model_yy
{
    User *user = [User yy_modelWithDictionary:dict_user];
    NSLog(@"YY---%@----%@---%u---%@---%@---%u----%d",user.name,user.icon,user.age,user.height,user.money,user.sex,user.gay);
    //打印结果
    //2016-07-04 11:06:59.746 PPDemos[2432:73824] MJ---Jack----lufy.png---20---1.55---100.9---1----1
    //2016-07-04 11:06:59.814 PPDemos[2432:73824] YY---Jack----lufy.png---20---1.55---100.9---1----1
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --- 设置数据（本地的）
-(void)setupDatas
{
    //简单的字典
    dict_user = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),/* 枚举需要使用NSNumber包装 */
                           @"gay" : @YES
                           };
    
    // 定义一个JSON字符串
    jsonStr = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    
    //复杂的字典
    dict_m8m = @{
                  @"text" : @"Agree!Nice weather!",
                  @"user" : @{
                          @"name" : @"Jack",
                          @"icon" : @"lufy.png"
                          },
                  @"retweetedStatus" : @{
                          @"text" : @"Nice weather!",
                          @"user" : @{
                                  @"name" : @"Rose",
                                  @"icon" : @"nami.png"
                                  }
                          }
                  };
    
    //模型中有个数组属性，数组里面又要装着其他模型
    dict_m8a = @{
                 @"statuses" : @[
                         @{
                             @"text" : @"Nice weather!",
                             @"user" : @{
                                     @"name" : @"Rose",
                                     @"icon" : @"nami.png"
                                     }
                             },
                         @{
                             @"text" : @"Go camping tomorrow!",
                             @"user" : @{
                                     @"name" : @"Jack",
                                     @"icon" : @"lufy.png"
                                     }
                             }
                         ],
                 @"ads" : @[
                         @{
                             @"image" : @"ad01.png",
                             @"url" : @"http://www.ad01.com"
                             },
                         @{
                             @"image" : @"ad02.png",
                             @"url" : @"http://www.ad02.com"
                             }
                         ],
                 @"totalNumber" : @"2014"
                 };

    
}
-(void)setupDatas_MJ
{
    dict_nokey = @{
                   @"id" : @"20",
                   @"desciption" : @"kids",
                   @"name" : @{
                           @"newName" : @"lufy",
                           @"oldName" : @"kitty",
                           @"info" : @[
                                   @"test-data",
                                   @{
                                       @"nameChangedTime" : @"2013-08"
                                       }
                                   ]
                           },
                   @"other" : @{
                           @"bag" : @{
                                   @"name" : @"a red bag",
                                   @"price" : @100.7
                                   }
                           }
                   };

}
@end
