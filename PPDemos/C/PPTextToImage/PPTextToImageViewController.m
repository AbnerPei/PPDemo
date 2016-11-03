//
//  PPTextToImageViewController.m
//  PPDemos
//
//  Created by Abner on 2016/10/20.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  来源 http://blog.csdn.net/justinjing0612/article/details/52635822
//  来源 [iOS开发绘制图片头像（将UILabel/UIView 转化成Image封装了一套方法）](http://codecloud.net/15746.html)

#import "PPTextToImageViewController.h"

@interface PPTextToImageViewController ()

@end

@implementation PPTextToImageViewController

- (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)imageForView:(UIView *)view
{
    
    //注释掉的方法不起用
//    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
//    
//    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
//        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
//    else
//        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
    
    //转化成image
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 40, 40)];
    imgview.backgroundColor = [UIColor colorWithRed:160/255.0 green:176/255.0 blue:213/255.0 alpha:1.0];
    imgview.layer.masksToBounds = YES;
    imgview.layer.cornerRadius = 20;
    [self.view addSubview:imgview];
    
    UILabel *temptext  = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    temptext.text = @"好";
    temptext.textColor = [UIColor whiteColor];
    temptext.textAlignment = NSTextAlignmentCenter;
    UIImage *image  = [self imageForView:temptext];
    imgview.image = image;
//========================
     /*
     UIImageView *imgview1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 180, 100, 100)];
     imgview1.backgroundColor = [UIColor lightGrayColor];
     [self.view addSubview:imgview1];
    
     NSString *string = @"景总是大神";
     NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
     [paragraphStyle setAlignment:NSTextAlignmentCenter];
     [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
     [paragraphStyle setLineSpacing:8.f];  //行间距
     [paragraphStyle setParagraphSpacing:2.f];//字符间距
     
     NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:12],
     NSForegroundColorAttributeName : [UIColor blueColor],
     NSBackgroundColorAttributeName : [UIColor clearColor],
     NSParagraphStyleAttributeName : paragraphStyle, };
     
     
     UIImage *image1  = [self imageFromString:string attributes:attributes size:imgview1.bounds.size];
     imgview1.image = image1;
      
      */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
