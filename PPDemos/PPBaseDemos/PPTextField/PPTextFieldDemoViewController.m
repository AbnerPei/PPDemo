//
//  PPTextFieldDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPTextFieldDemoViewController.h"
#import "PPTextFieldDemoCell.h"
#import "PPTFModel.h"
#import "NSString+Verify.h"

@interface PPTextFieldDemoViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableV  */
@property(nonatomic,strong)UITableView *tableView;
/** pptfModel  */
@property(nonatomic,strong)PPTFModel *aPPTFModel;
@end

@implementation PPTextFieldDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self creatVCUI];
    
    if (!_aPPTFModel) {
        _aPPTFModel = [[PPTFModel alloc]init];
    }
}
-(void)creatVCUI
{
    _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor pp_strawberryColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //去掉多余的分割线
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPTextFieldDemoCell *cell = [PPTextFieldDemoCell cellWithTableView:tableView];
    [cell setupCellWithLimitStyle:indexPath.row andPPTFModel:_aPPTFModel];
    
    cell.rightTF.ppTextfieldTextChangedBlock = ^(PPTextfield *tf){
        //只简单的列举两个例子
        if (indexPath.row == 0) {
            self.aPPTFModel.pptfName = tf.text;
            NSLog(@"(不区分中英文)name is %@",self.aPPTFModel.pptfName);
        }else if (indexPath.row == 6) {
            self.aPPTFModel.pptfPrice = tf.text;
            NSLog(@"(价格)price is %@",self.aPPTFModel.pptfPrice);
            
        }
        
    };
    
    //点击done,会走
    cell.rightTF.ppTextFieldEndEditBlock = ^(PPTextfield *tf){
        if (indexPath.row == 4){
            self.aPPTFModel.pptfPhone = tf.text;
            NSLog(@"(电话号码)phoneNumber is %@",self.aPPTFModel.pptfPhone);
            [self.view endEditing:YES];

            if ([self.aPPTFModel.pptfPhone pp_isPhoneNumber]) {
                UIAlertView(@"很好，你输入了正确的电话号码");
            }else{
                UIAlertView(@"你是逗比吧，连个电话号码的格式都不知道！");
            }
        }
    };
    
    //用区分中英文的name测试ppTextFieldReturnTypeBlock的回调
    cell.rightTF.ppTextFieldReturnTypeBlock = ^(PPTextfield *tf){
        if (indexPath.row == 1) {
            UIAlertView(@"你点击键盘右下角的“Done”,我就弹窗！！！还强改你的文字！！！");
            [self.view endEditing:YES];
            self.aPPTFModel.pptfNameCNEN = @"PPTF";
            tf.text = self.aPPTFModel.pptfNameCNEN;
        }
    };
    
    return cell;
}


@end
