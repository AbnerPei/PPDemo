//
//  AlgorithmViewController.m
//  PPDemos
//
//  Created by Abner on 16/9/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//
//https://my.oschina.net/lych0317/blog/267300
//http://www.tuicool.com/articles/RBnqqeQ
//[iOS 正则表达式 NSRegularExpression](http://zhuhaibobb.blog.163.com/blog/static/27440067201411752450958/)
#import "AlgorithmViewController.h"

@interface AlgorithmViewController ()

@end

@implementation AlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)replace:(NSString *)str {
    // CODE HERE
    NSMutableString *retString = [NSMutableString stringWithString:str];
    // 准备替换的字符串
    NSString *replaceString = @"bb";
    // 正则表达式 (^a{2}[^a]) 以aa（第三个字母不是a）开头，([^a]a{2}[^a]) 字符串中间的aa（前后都不是a），([^a]a{2}$) 以aa结尾（倒数第三个字母不是a）
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"(^a{2}[^a])|([^a]a{2}[^a])|([^a]a{2}$)" options:NSMatchingReportProgress error:nil];
    NSRange range;
    do {
        range = [regular rangeOfFirstMatchInString:retString options:NSMatchingReportProgress range:NSMakeRange(0, retString.length)];
        if (range.length == 4) {// 替换中间的aa
            [retString replaceCharactersInRange:NSMakeRange(range.location + 1, 2) withString:replaceString];
        } else if (range.length > 0) {
            if (range.location == 0) {// 替换开头的aa
                [retString replaceCharactersInRange:NSMakeRange(range.location, 2) withString:replaceString];
            } else {// 替换结尾的aa
                [retString replaceCharactersInRange:NSMakeRange(retString.length - 2, 2) withString:replaceString];
            }
        }
    } while (range.length > 0);
    return retString;
}
@end
