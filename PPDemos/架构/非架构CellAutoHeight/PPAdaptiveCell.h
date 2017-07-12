//
//  PPAdaptiveCell.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/6.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZTextView.h"
@protocol PPAdaptiveCellDelegate<UITableViewDelegate,UITableViewDataSource>

@required
- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath;

@optional
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath;
- (BOOL)tableView:(UITableView *)tableView textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)tableView:(UITableView *)tableView textViewDidChangeSelection:(UITextView*)textView;
- (void)tableView:(UITableView *)tableView textViewDidEndEditing:(UITextView*)textView;
@end

@interface PPAdaptiveCell : UITableViewCell
/** textView  */
@property(nonatomic,strong)SZTextView *textView;
/** tabV  */
@property(nonatomic,strong)UITableView *tableView;
/** text  */
@property(nonatomic,copy)NSString *text;

@end

@interface UITableView (PPAdaptiveCell)
-(PPAdaptiveCell *)pp_cell;
@end
