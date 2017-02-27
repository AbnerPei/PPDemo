//
//  AnimationBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/29.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AnimationBaseViewController.h"
#import "AnimationShowViewController.h"
@interface AnimationBaseViewController ()
@property (nonatomic) NSArray  *datas;
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableArray *vcs;

@end

@implementation AnimationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS Animation";
    [self setupArrs];
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"animation示例"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"AnimationShowViewController"
                  ] mutableCopy];
    
    self.datas = @[@"transformAnimation"
//                   @"loadingCircleJoinAnimation",
//                   @"loadingDotAnimation",
//                   @"loadingCustomAnimations",
//                   @"loadingGifAnimations",
//                   @"loadingFailure",
//                   @"loadingFailure2",
//                   @"classMethod",
                   ];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    AnimationShowViewController * showVC = [AnimationShowViewController new];
    showVC.selName = _datas[indexPath.row];
    [self.navigationController pushViewController:showVC animated:YES];
}
@end
