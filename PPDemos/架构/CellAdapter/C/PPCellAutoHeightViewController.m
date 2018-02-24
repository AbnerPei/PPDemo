////
////  PPCellAutoHeightViewController.m
////  PPDemos
////
////  Created by ╰莪呮想好好宠Nǐつ on 2017/7/6.
////  Copyright © 2017年 PPAbner. All rights reserved.
////
//
//#import "PPCellAutoHeightViewController.h"
//#import "PPAutoHeightCell.h"
//
//@interface PPCellAutoHeightViewController ()<UITableViewDelegate,UITableViewDataSource>
///** tabV  */
//@property(nonatomic,strong)UITableView *tableView;
///** <#注释#>  */
//@property(nonatomic,strong)NSMutableArray <PPCellAdapter *> *adapterArrs;
//@end
//
//@implementation PPCellAutoHeightViewController
//
//-(NSMutableArray *)adapterArrs
//{
//    if (_adapterArrs == nil) {
//        _adapterArrs = [NSMutableArray array];
//    }
//    return _adapterArrs;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    NSArray *textStrArr = @[
//                            @"上海市闵行区七莘路联明路黎明花园",
//                            @"江苏省昆山市花桥镇花溪畔居435号",
//                            @"呵呵呵恩恩 发送了金粉世家发牢骚 时间到了就分手了副教授睡觉了福建省立方束带结发了身份 四六级烦死了呵呵呵恩恩 发送了金粉世家发牢骚 时间到了就分手了副教授睡觉了福建省立方束带结发了身份 四六级烦死了"
//                            ];
//    for (int i = 0; i<3; i++) {
//        CGFloat height = [PPAutoHeightCell pp_cellHeightWithCellData:textStrArr[i]];
//        PPCellAdapter *adapter = [[PPCellAdapter alloc]initWithDataSource:textStrArr[i] reuseIdentifier:nil height:height style:PPCellAdapterStyleTextFold];
//        
////        [PPCellAdapter pp_cellAdapterMakeWithCellClass:[PPAutoHeightCell class] cellHeight:height cellxData:textStrArr[i] cellType:0];
//        [self.adapterArrs addObject:adapter];
//    }
//    
////    _tableView = [UITableView pp_tableVMakeWithSuperV:self.view frame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) delegate:self bgColor:[UIColor whiteColor] style:UITableViewStylePlain];
//}
//
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    return self.adapterArrs[indexPath.row].cellHeight;
//#warning pp605 2017-12-18待定
//    return 100;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    PPAutoHeightCell *cell = [PPAutoHeightCell pp_cellMakeWithTableView:tableView cellAdapter:self.adapterArrs[indexPath.row] indexPath:indexPath];
//    cell.autoHeightBlock = ^(PPCellAdapter *adapter) {
//        [self.adapterArrs replaceObjectAtIndex:indexPath.row withObject:adapter];
//    };
//    cell.backgroundColor = [UIColor cyanColor];
//    if (indexPath.row%2 == 0) {
//        cell.backgroundColor = [UIColor redColor];
//    }
//    return cell;
//    
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.adapterArrs.count;
//}
//
//
//@end

