//
//  NSMutableAttributedString+NSStringNSMutableAttributedString.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSMutableAttributedString+NSStringNSMutableAttributedString.h"

@implementation NSMutableAttributedString (NSStringNSMutableAttributedString)
+(instancetype)pp_attributedStringHandleWithIdText:(id)idText
{
    NSMutableAttributedString *attributedStr;
    if ([idText isKindOfClass:[NSAttributedString class]]) {
        attributedStr = (NSMutableAttributedString *)idText;
    }else if ([idText isKindOfClass:[NSString class]]){
        NSString *textStr = (NSString *)idText;
        attributedStr = [[NSMutableAttributedString alloc]initWithString:textStr];
    }else{
        NSLog(@"PP警告：你传入的类型不是我想要的(NSMutableAttributedString* NSString *)，请仔细看.h中文件类型");
    }
    return attributedStr;
}
@end
