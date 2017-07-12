//
//  PPAutoHeightCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/6.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPAutoHeightCell.h"

@interface PPAutoHeightCell ()<YYTextViewDelegate>
/** textView  */
@property(nonatomic,strong)YYTextView *textView;
@end
@implementation PPAutoHeightCell
-(void)pp_cellAddSubviews
{
    self.textView = [YYTextView new];
    [self.contentView addSubview:self.textView];
    self.textView.placeholderText = @"text测试";
    self.textView.font = [UIFont systemFontOfSize:16];
    self.textView.placeholderTextColor = [UIColor pp_cyanColor];
    self.textView.delegate = self;
//    self.textView.textContainerInset = UIEdgeInsetsMake(5, 10, 5, 10);
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.scrollEnabled = NO;
    
}
-(void)pp_cellAddDataAndFrame
{
    NSString *textStr = (NSString *)self.cellAdapter.cellData;
    self.textView.text = textStr;
    
    CGFloat textHeight = [NSObject pp_calculateSizeWithContainerSize:CGSizeMake(ScreenWidth-20, CGFLOAT_MAX) text:textStr font:@16 calculateForType:PPCalculateSizeForTypeYYLabel].height+10;
//    textHeight = (textHeight <= 70) ? 70:textHeight;
    self.textView.frame = CGRectMake(0, 0, ScreenWidth-20, textHeight);
    if (self.autoHeightBlock) {
        self.cellAdapter.cellHeight = textHeight;
        self.autoHeightBlock(self.cellAdapter);
    }
    
    [self pp_cellUpdateWithNewCellHeight:textHeight animated:YES];
    
    

}
+(CGFloat)pp_cellHeightWithCellData:(id)data
{
    CGFloat textHeight = [NSObject pp_calculateSizeWithContainerSize:CGSizeMake(ScreenWidth-20, CGFLOAT_MAX) text:data font:@16 calculateForType:PPCalculateSizeForTypeYYLabel].height+10;
    return textHeight;
}
- (BOOL)textViewShouldBeginEditing:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
    return YES;
}
- (BOOL)textViewShouldEndEditing:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
    return YES;
}
- (void)textViewDidBeginEditing:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
}
- (void)textViewDidEndEditing:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
}
- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"%s---%@",__func__,textView.text);
    return YES;
}
- (void)textViewDidChange:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
    self.cellAdapter.cellData = textView.text;
    self.cellData = textView.text;
    [self pp_cellAddDataAndFrame];
}
- (void)textViewDidChangeSelection:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
}
@end
