//
//  PP_QRCodeScanViewController.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/22.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol PP_QRCodeScanDelegate <NSObject>

/*!
 * @author ╰莪呮想好好宠Nǐつ, 16-05-22 21:05:34
 * 扫描完成的代理
 */
-(void)pp_QRCodeDidScanWithResultStr:(NSString *)resultStr;

@end

@interface PP_QRCodeScanViewController : UIViewController

@property(nonatomic,assign)id<PP_QRCodeScanDelegate> delegate;

@end
