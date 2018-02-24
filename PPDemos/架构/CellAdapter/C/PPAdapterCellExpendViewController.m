////
////  PPAdapterCellExpendViewController.m
////  PPDemos
////
////  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
////  Copyright © 2017年 PPAbner. All rights reserved.
////
//
//#import "PPAdapterCellExpendViewController.h"
//#import "ShowTextModel.h"
//#import "PPCellExpandCell.h"
//#import "PPBaseCell+TableView.h"
//
//@interface PPAdapterCellExpendViewController ()<UITableViewDelegate,UITableViewDataSource>
///** tableV  */
//@property(nonatomic,strong)UITableView *tableView;
///** adapter数组  */
//@property(nonatomic,strong)NSMutableArray <PPCellAdapter *> *adapterArrs;
//@end
//
//@implementation PPAdapterCellExpendViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self creatTableV];
//    
//    [self getData];
//}
//-(NSMutableArray *)adapterArrs
//{
//    if (_adapterArrs == nil) {
//        _adapterArrs = [NSMutableArray array];
//    }
//    return _adapterArrs;
//}
//-(void)creatTableV
//{
//    self.tableView = [UITableView pp_tableVMakeWithSuperV:self.view frame:self.view.bounds delegate:self bgColor:[UIColor pp_lightGrayColor] style:UITableViewStylePlain];
//    
//}
//-(void)getData
//{
//    NSArray *strings = @[
//                         @"AFNetworking is a delightful networking library for iOS and Mac OS X. It's built on top of the Foundation URL Loading System, extending the powerful high-level networking abstractions built into Cocoa. It has a modular architecture with well-designed, feature-rich APIs that are a joy to use. Perhaps the most important feature of all, however, is the amazing community of developers who use and contribute to AFNetworking every day. AFNetworking powers some of the most popular and critically-acclaimed apps on the iPhone, iPad, and Mac. Choose AFNetworking for your next project, or migrate over your existing projects—you'll be happy you did!",
//                         
//                         @"黄色的树林里分出两条路，可惜我不能同时去涉足，我在那路口久久伫立，我向着一条路极目望去，直到它消失在丛林深处。但我却选了另外一条路，它荒草萋萋，十分幽寂，显得更诱人、更美丽，虽然在这两条小路上，都很少留下旅人的足迹，虽然那天清晨落叶满地，两条路都未经脚印污染。呵，留下一条路等改日再见！但我知道路径延绵无尽头，恐怕我难以再回返。也许多少年后在某个地方，我将轻声叹息把往事回顾，一片树林里分出两条路，而我选了人迹更少的一条，从此决定了我一生的道路。",
//                         
//                         @"★タクシー代がなかったので、家まで歩いて帰った。★もし事故が発生した场所、このレバーを引いて列车を止めてください。（丁）为了清楚地表示出一个短语或句节，其后须标逗号。如：★この薬を、夜寝る前に一度、朝起きてからもう一度、饮んでください。★私は、空を飞ぶ鸟のように、自由に生きて行きたいと思った。*****为了清楚地表示词语与词语间的关系，须标逗号。标注位置不同，有时会使句子的意思发生变化。如：★その人は大きな音にびっくりして、横から飞び出した子供にぶつかった。★その人は、大きな音にびっくりして横から飞び出した子供に、ぶつかった。",
//                         
//                         @"Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth; Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay In leaves no step had trodden black. Oh, I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less traveled by, And that has made all the difference. ",
//                         
//                         @"Star \"https://github.com/YouXianMing\" :)"
//                         ];
//    [NSObject pp_gcdAfter:^{
//        NSMutableArray *indexPaths = [NSMutableArray array];
//        
//        for (int i = 0; i < strings.count; i++) {
//            
//            ShowTextModel *model = [[ShowTextModel alloc] init];
//            model.inputString    = strings[i];
//            
//            [PPCellExpandCell pp_cellHeightWithCellData:model];
//            
//            PPCellAdapter *adapter = [PPCellAdapter pp_cellAdapterMakeWithCellClass:[PPCellExpandCell class] cellHeight:model.normalStringHeight cellData:model cellType:kShowTextCellNormalType];
//            [self.adapterArrs addObject:adapter];
//            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
//        }
//        
//        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
//    } delay:0];
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//#warning pp605 img start
////    return self.adapterArrs[indexPath.row].cellHeight;
//#warning pp605 img start
//    return 200;
//
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.adapterArrs.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{    
//    return [PPCellExpandCell pp_cellMakeWithTableView:tableView cellAdapter:self.adapterArrs[indexPath.row] indexPath:indexPath];
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     [(PPCellExpandCell *)[tableView cellForRowAtIndexPath:indexPath] pp_cellDidSelected];
//}
//
//
//@end

