//
//  ContextMenusViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/14.
//

#import "ContextMenusViewController.h"
#import <PPMaker/PPMaker.h>

@interface ContextMenusViewController ()<UIContextMenuInteractionDelegate>
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIContextMenuInteraction *contextMenuInteraction;
@end

@implementation ContextMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.textLabel];
    
    _contextMenuInteraction = [[UIContextMenuInteraction alloc] initWithDelegate:self];
    [self.textLabel addInteraction:_contextMenuInteraction];
}


#pragma mark --- UIContextMenuInteractionDelegate
- (UIContextMenuConfiguration *)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location 
{
   
    
    UIContextMenuActionProvider actionProvider = ^UIMenu *(NSArray<UIMenuElement *> *suggestedActions){
        UIAction *action1 = [UIAction actionWithTitle:@"Favorite" image:[UIImage systemImageNamed:@"heart.fill"] identifier:@"action1" handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"点击了Favorite");
        }];
//        action1.state = UIMenuElementStateOff;
    //    action1.attributes =
        
        UIAction *action2 = [UIAction actionWithTitle:@"Share" image:[UIImage systemImageNamed:@"square.and.arrow.up.fill"] identifier:@"action2" handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"点击了Share");
        }];
//        action2.state = UIMenuElementStateOff;

        UIAction *action3 = [UIAction actionWithTitle:@"Delete" image:[UIImage systemImageNamed:@"trash.fill"] identifier:@"action3" handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"点击了Delete");
        }];
//        action3.state = UIMenuElementStateOff;
        return [UIMenu menuWithTitle:@"888" children:@[action1, action2, action3]];
    };
    return [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:nil actionProvider:actionProvider];
}

#pragma mark --- lazy load
- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [PPMAKELB pp_make:^(PPMake *make) {
            make.text(@"长按此Label，查看效果");
            make.bgColor(UIColor.purpleColor);
            make.textColor(UIColor.whiteColor);
            make.font([UIFont boldSystemFontOfSize:20]);
            make.frame(CGRectMake(10, 100, 200, 200));
//            make.cornerRadius(100);
            make.numberOfLines(0);
            make.userInteractionEnabled(YES);
        }];
    }
    return _textLabel;
}


@end
