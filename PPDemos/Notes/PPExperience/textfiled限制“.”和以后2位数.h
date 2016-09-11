//
//  textfiled限制“.”和以后2位数.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/4/30.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef textfiled________2___h
#define textfiled________2___h

#pragma mark --- 限制只能输入一个"."
+ (void)LC_LimitedPointOnlyOne:(UITextField *)LC_tf
{
    NSString *newStr = LC_tf.text;
    NSString *temp = nil;
    int commonWordCount = 0;
    for(int i =0; i < [newStr length]; i++)
    {
        temp = [newStr substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"."]) {
            commonWordCount++;
            NSLog(@"第%d个字是:%@----%d", i, temp,commonWordCount);
            if (commonWordCount >= 2) {
                newStr = [newStr substringToIndex:newStr.length-1];
                LC_tf.text = newStr;
            }
        }
        
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
          ProductTextCell *cell = [ProductTextCell cellWithTableView:tableView];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
          [cell setupProductTextCell:@"商品规格" placeholderStr:@"必须限制在15字以内，例如：300g" aLCProduct:aPro];
          cell.detailTf.delegate = self;        cell.detailTfBlock = ^(ProductTextCell *aProductTextCell){
          [Utils LC_LimitedPointOnlyOne:aProductTextCell.detailTf];
          aLcProducct. numrealbuy = aProductTextCell.detailTf.text;
          NSLog(@"cell.detailTf.text---%@",aLcProducct. numrealbuy);
    };
}

#pragma mark --- 实现UITextFieldDelegate的方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString * futureString = [NSMutableString stringWithString:textField.text];
    [futureString  insertString:string atIndex:range.location];

    NSInteger flag=0;
    const NSInteger limited = 2;//小数点后需要限制的个数
    
    for (int i = (int)futureString.length-1; i>=0; i--) {
        if ([futureString characterAtIndex:i] == '.') {
            if (flag > limited) {
                return NO;
            }
            break;
        }
        flag++;
    }
    return YES;
}
#endif /* textfiled________2___h */
