
//
//  PP_SearchBar使用指导.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/10.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef PP_SearchBar_____h
#define PP_SearchBar_____h

#import "MineViewController.h"
#import "UIView+PPCategory.h"
#import "PP_SearchBar.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    
    PP_SearchBar *searchBar = [[PP_SearchBar alloc]initWithFrame:CGRectMake(0,100, PPMT_SCREENWIDTH, 44)];
    searchBar.PP_searchBarPlaceholder = @"333,444,555";
    searchBar.PP_searchBarPlaceholderColor = [UIColor blueColor];
    searchBar.PP_searchBarHeight = 40;
    searchBar.PP_searchBarTextColor = [UIColor greenColor];
    searchBar.backgroundColor = [UIColor redColor];
    [searchBar PP_cancelBTClickedBlock:^(UISearchBar *searchBar) {
        PPLog(@"点击了取消按钮--%@",searchBar.text);
        searchBar.text = nil;
        [searchBar resignFirstResponder];
    }];
    
    [searchBar PP_SearchBarTextDidBeginEditingBlock:^(UISearchBar *searchBar) {
        NSLog(@"ppVCVC---%@",searchBar.text);
    }];
    
    [searchBar PP_SearchBarTextDidChangeBlock:^(UISearchBar *searchBar, NSString *searchText) {
        NSLog(@"222changed---%@",searchText);
    }];
    
    [searchBar PP_SearchBarTextDidEndEditingBlock:^(UISearchBar *searchBar) {
        NSLog(@"结束输入");
        
    }];
    
    [searchBar PP_SearchBarSearchButtonClickedBlock:^(UISearchBar *searchBar) {
        NSLog(@"点击键盘搜索---%@",searchBar.text);
    }];
    //Set to titleView
    //    [self.navigationItem.titleView sizeToFit];
    //    self.navigationItem.titleView = searchBar;
    self.view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:searchBar];
    
}



#endif /* PP_SearchBar_____h */
