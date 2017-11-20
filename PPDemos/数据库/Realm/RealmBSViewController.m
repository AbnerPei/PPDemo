//
//  RealmBSViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "RealmBSViewController.h"
#import "BSModelHeaders.h"
#import "PPRealmHelper.h"

static NSString *K_BSListDataKey = @"BSJokeListNetworkData";

@interface RealmBSViewController ()
{
    NSString *_requestIdentifier;
}
/** listDatas */
@property(nonatomic,strong) NSMutableArray<BSJoke *> *listDatas;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation RealmBSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _requestIdentifier = @"0";
    
    _listDatas = [NSMutableArray array];

//    [PPRealmHelper pp_rlm_removeDefaultFile];
//    [self getBSJokeListNetworkData];
    
    RLMResults *listResults = [BSJokeListResult allObjects];
    

    RLMResults *aToGoGirlHomeJoke = [BSJoke objectsWhere:@"jokeId == %@",@"26850156"];
    

    NSLog(@"pp_directory_homePath %@",[NSString pp_directory_homePath]);
    
}

-(void)getBSJokeListNetworkData
{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@%@-20.json",K_Charles_BS,K_Charles_BS_JokeList,_requestIdentifier];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:requestUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"bs 段子列表 %@",responseObject);
        [self handleNetworkData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
-(void)handleNetworkData:(id)responseObject
{
    BSJokeListResult *listResult = [BSJokeListResult mj_objectWithKeyValues:responseObject];
    BSJokeListResultInfo *info = listResult.info;
    _requestIdentifier = info.np;
    
    for (BSJoke *aJoke in listResult.list) {
        [_listDatas addObject:aJoke];
        for (BSTopComment *aTopComment in aJoke.top_comments) {
            if (aTopComment.u) {
                BSUser *aUser = aTopComment.u;
                [self handelU:aUser];
            }
        }
        [self handelU:aJoke.u];
    }
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:listResult];
    }];
    
    [self.tableView reloadData];
    
}
-(void)handelU:(BSUser *)aUser
{
//    aUser.userHeader = [[RLMArray alloc]initWithObjectClassName:BSUser.className];
    for (NSString *url in aUser.header) {
        BSUserHeader *aHeader = [[BSUserHeader alloc]init];
        aHeader.headerUrl = url;
        [aUser.userHeader addObject:aHeader];
    }
}
@end

