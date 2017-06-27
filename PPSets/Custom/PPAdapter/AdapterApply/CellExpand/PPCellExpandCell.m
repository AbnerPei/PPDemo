//
//  PPCellExpandCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCellExpandCell.h"
#import "ShowTextModel.h"

@interface PPCellExpandCell ()
@property (nonatomic, strong) UILabel  *normalLabel;
@property (nonatomic, strong) UILabel  *expendLabel;
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
    
    self.normalLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth - 20, 0)];
    self.normalLabel.numberOfLines = 3.f;
    self.normalLabel.textColor     = [UIColor grayColor];
    self.normalLabel.font          = [UIFont systemFontOfSize:14.f];
    [self.contentView addSubview:self.normalLabel];
    
    self.expendLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth - 20, 0)];
    self.expendLabel.numberOfLines = 0;
    self.expendLabel.textColor     = [UIColor blackColor];
    self.expendLabel.font          = [UIFont systemFontOfSize:14.f];
    [self.contentView addSubview:self.expendLabel];

}

-(void)pp_cellAddDataAndFrame
{
    ShowTextModel   *model   = self.cellAdapter.cellData;
    PPCellAdapter *adapter = self.cellAdapter;
    
    if (adapter.cellType == kShowTextCellNormalType) {
        
        self.normalLabel.text  = model.inputString;
        self.normalLabel.frame = CGRectMake(10, 10, ScreenWidth - 20, 0);
        self.normalLabel.alpha = 1;
        [self.normalLabel sizeToFit];
        
        self.expendLabel.text  = model.inputString;
        self.expendLabel.frame = CGRectMake(10, 10, ScreenWidth - 20, 0);
        self.expendLabel.alpha = 0;
        [self.expendLabel sizeToFit];
        
        self.stateView.backgroundColor = [UIColor grayColor];
        
    } else {
        
        self.normalLabel.text  = model.inputString;
        self.normalLabel.frame = CGRectMake(10, 10, ScreenWidth - 20, 0);
        self.normalLabel.alpha = 0;
        [self.normalLabel sizeToFit];
        
        self.expendLabel.text  = model.inputString;
        self.expendLabel.frame = CGRectMake(10, 10, ScreenWidth - 20, 0);
        self.expendLabel.alpha = 1;
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
        
        CGFloat totalStringHeight = [self heightWithStringFont:[UIFont systemFontOfSize:14.f] fixedWidth:(ScreenWidth - 20.f) str:model.inputString];
        CGFloat oneLineHeight     = [self oneLineOfTextHeightWithStringFont:[UIFont systemFontOfSize:14.f]];
        CGFloat normalTextHeight  = totalStringHeight >= 3 * oneLineHeight ? 3 * oneLineHeight : totalStringHeight;
        
        // Expend string height.
        model.expendStringHeight = 10 + totalStringHeight + 10;
        
        // One line height.
        model.normalStringHeight = 10 + normalTextHeight + 10;
    }
    
    return 0.f;
}

+ (CGFloat)heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width str:(NSString *)str{
    
    NSParameterAssert(font);
    
    CGFloat height = 0;
    
    if (str.length) {
        
        CGRect rect = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName: font}
                                         context:nil];
        
        height = rect.size.height;
    }
    
    return height;
}

+ (CGFloat)oneLineOfTextHeightWithStringFont:(UIFont *)font {
    
    NSParameterAssert(font);
    
    CGFloat height = 0;
    CGRect rect    = [@"One" boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName: font}
                                          context:nil];
    
    height = rect.size.height;
    return height;
}

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
