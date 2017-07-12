//
//  PPAdaptiveCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/6.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPAdaptiveCell.h"

@interface PPAdaptiveCell ()<UITextViewDelegate>
{
    CGFloat _textViewY;
}
@end
@implementation PPAdaptiveCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.textView];
    }
    return self;
}

- (SZTextView *)textView
{
    if (_textView == nil) {
        CGRect cellFrame = self.contentView.bounds;
        
        _textView = [[SZTextView alloc] initWithFrame:CGRectMake(0, _textViewY, cellFrame.size.width, cellFrame.size.height-_textViewY)];
        _textView.delegate = self;
        
        _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _textView.font = [UIFont systemFontOfSize:18.0f];
        
        _textView.scrollEnabled = NO;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.showsHorizontalScrollIndicator = NO;
        self.textView.placeholder = @"text测试";
    }
    return _textView;
}

-(void)setText:(NSString *)text
{
    _text = text;
    self.textView.text = text;
    [self performSelector:@selector(textViewDidChange:) withObject:self.textView afterDelay:0.1];
}

- (void)textViewDidChange:(YYTextView *)textView
{
    NSLog(@"%s---%@",__func__,textView.text);
    if ([self.tableView.delegate conformsToProtocol:@protocol(PPAdaptiveCellDelegate)]) {
        id<PPAdaptiveCellDelegate> delegate = (id<PPAdaptiveCellDelegate>)self.tableView.delegate;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:self];
        
        // update the text
        _text = self.textView.text;
        
        [delegate tableView:self.tableView
                updatedText:_text
                atIndexPath:indexPath];
        
        //
        CGFloat currentTextHeight = [self getTextViewHeight];
        CGFloat oldTextHeight = [delegate tableView:self.tableView heightForRowAtIndexPath:indexPath];
        
        if (fabs(currentTextHeight-oldTextHeight) > 0.01) {
            // update the height
            if ([delegate respondsToSelector:@selector(tableView:updatedHeight:atIndexPath:)]) {
                [delegate tableView:self.tableView
                      updatedHeight:currentTextHeight
                        atIndexPath:indexPath];
            }
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
        }
        
    }
}

-(CGFloat)getTextViewHeight
{
    CGFloat textHeight = [self.textView sizeThatFits:CGSizeMake(self.textView.frame.size.width, CGFLOAT_MAX)].height+2;
    NSLog(@"%f---%s",textHeight,__func__);
    return textHeight;
}

@end

@implementation UITableView (PPAdaptiveCell)

-(PPAdaptiveCell *)pp_cell
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"%@Identifier",NSStringFromClass([PPAdaptiveCell class])];
    PPAdaptiveCell *cell = [self dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[PPAdaptiveCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tableView = self;
    }
    return cell;
}

@end
