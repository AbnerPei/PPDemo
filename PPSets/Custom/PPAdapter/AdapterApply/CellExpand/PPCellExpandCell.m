//
//  PPCellExpandCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCellExpandCell.h"
#import "ShowTextModel.h"

#define KLBTop 15

@interface PPCellExpandCell ()
@property (nonatomic, strong) YYLabel  *normalLabel;
@property (nonatomic, strong) YYLabel  *expendLabel;
@property (nonatomic, strong) UIView   *line;
@property (nonatomic, strong) UIView   *stateView;
@end

@implementation PPCellExpandCell

-(void)pp_cellConfigure
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)pp_cellAddSubviews
{
    self.line                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5f)];
    self.line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [self.contentView addSubview:self.line];
    
    self.stateView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 13, 2, 15)];
    self.stateView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.stateView];
    
    self.normalLabel = [YYLabel pp_lbMakeWithSuperV:self.contentView bgColor:nil font:@14 textColor:[UIColor blackColor] numberOfLines:3];
    
    self.expendLabel = [YYLabel pp_lbMakeWithSuperV:self.contentView bgColor:nil font:@14 textColor:[UIColor blackColor] numberOfLines:0];

}

-(void)pp_cellAddDataAndFrame
{
    ShowTextModel   *model   = self.cellAdapter.cellData;
    PPCellAdapter *adapter = self.cellAdapter;

    if (adapter.cellType == kShowTextCellNormalType) {
        
        self.normalLabel.text  = model.inputString;
        self.normalLabel.frame = CGRectMake(10, KLBTop, ScreenWidth - 20, model.normalStringHeight);
        self.normalLabel.alpha = 1;
        [self.normalLabel sizeToFit];
        
        self.expendLabel.text  = model.inputString;
        self.expendLabel.frame = CGRectMake(10, KLBTop, ScreenWidth - 20, model.normalStringHeight);
        self.expendLabel.alpha = 0;
        [self.expendLabel sizeToFit];
        
        self.stateView.backgroundColor = [UIColor grayColor];
        
    } else {
        
        self.normalLabel.text  = model.inputString;
        self.normalLabel.frame = CGRectMake(10, KLBTop, ScreenWidth - 20, model.expendStringHeight);
        self.normalLabel.alpha = 0;
        [self.normalLabel sizeToFit];
        self.normalLabel.numberOfLines = 0;
        
        self.expendLabel.text  = model.inputString;
        self.expendLabel.frame = CGRectMake(10, KLBTop, ScreenWidth - 20, model.expendStringHeight);
        self.expendLabel.alpha = 1;
        self.expendLabel.numberOfLines = 0;

        [self.expendLabel sizeToFit];
        
        self.stateView.backgroundColor = [UIColor redColor];
    }
    
    if (self.indexPath.row == 0) {
        
        self.line.hidden = YES;
        
    } else {
        
        self.line.hidden = NO;
    }

}

+(CGFloat)pp_cellHeightWithCellData:(id)data
{
    ShowTextModel *model = data;
    
    if (model) {
        
         CGFloat totalStringHeight = [YYLabel pp_calculateYYLabelWithContainerSize:CGSizeMake(ScreenWidth - 20.f, CGFLOAT_MAX) font:@14 text:model.inputString].height;
//        [YYLabel pp_calculateYYLabelWithContainerSize:CGSizeMake(ScreenWidth - 20.f, CGFLOAT_MAX) text:model.inputString calculateBlock:^(CGSize size, NSUInteger lineCount) {
//            totalStringHeight = size.height;
//        }];
        
        
         CGFloat oneLineHeight = [YYLabel pp_calculateYYLabelWithContainerSize:CGSizeMake(ScreenWidth - 20.f, CGFLOAT_MAX) font:@14 text:@"OneLine"].height;
//        [YYLabel pp_calculateYYLabelWithContainerSize:CGSizeMake(200, CGFLOAT_MAX) text:@"one" calculateBlock:^(CGSize size, NSUInteger lineCount) {
//            oneLineHeight = size.height;
//        }];
//        [self oneLineOfTextHeightWithStringFont:[UIFont systemFontOfSize:14.f]];
        CGFloat normalTextHeight  = totalStringHeight >= 3 * oneLineHeight ? 3 * oneLineHeight : totalStringHeight;
        
        // Expend string height.
        model.expendStringHeight = totalStringHeight+KLBTop*2;
        
        // One line height.
        model.normalStringHeight = normalTextHeight+KLBTop*2;
    }
    
    return 0.f;
}

//+ (CGFloat)heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width str:(NSString *)str{
//    
//    NSParameterAssert(font);
//    
//    CGFloat height = 0;
//    
//    if (str.length) {
//        
//        CGRect rect = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
//                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
//                       NSStringDrawingUsesFontLeading
//                                      attributes:@{NSFontAttributeName: font}
//                                         context:nil];
//        
//        height = rect.size.height;
//    }
//    
//    return height;
//}
//
//+ (CGFloat)oneLineOfTextHeightWithStringFont:(UIFont *)font {
//    
//    NSParameterAssert(font);
//    
//    CGFloat height = 0;
//    CGRect rect    = [@"One" boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
//                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
//                      NSStringDrawingUsesFontLeading
//                                       attributes:@{NSFontAttributeName: font}
//                                          context:nil];
//    
//    height = rect.size.height;
//    return height;
//}

- (void)changeState {
    
    ShowTextModel   *model   = self.cellAdapter.cellData;
    PPCellAdapter *adapter = self.cellAdapter;
    
    if (adapter.cellType == kShowTextCellNormalType) {
        
        adapter.cellType = kShowTextCellExpendType;
        [self pp_cellUpdateWithNewCellHeight:model.expendStringHeight animated:YES];
        [self expendState];
        
    } else {
        
        adapter.cellType = kShowTextCellNormalType;
        [self pp_cellUpdateWithNewCellHeight:model.normalStringHeight animated:YES];
        [self normalState];
    }
}

-(void)pp_cellDidSelected
{
    [self changeState];
}

- (void)normalState {
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.normalLabel.alpha         = 1;
        self.expendLabel.alpha         = 0;
        self.stateView.backgroundColor = [UIColor grayColor];
    }];
}

- (void)expendState {
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.normalLabel.alpha         = 0;
        self.expendLabel.alpha         = 1;
        self.stateView.backgroundColor = [UIColor redColor];
    }];
}



@end
