//
//  LongPressToSaveViewController.m
//  MassonryDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  http://www.jianshu.com/p/537945866b58

#import "LongPressToSaveViewController.h"

@interface LongPressToSaveViewController ()<UIActionSheetDelegate>
{
    UIImageView *imgV;
}
@end

@implementation LongPressToSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"meinv"]];
    imgV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imgV];
    //一定要注意下面的一句不可少，imageview默认是不能交互的！
    imgV.userInteractionEnabled = YES;

    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imglongTapClick:)];
    [imgV addGestureRecognizer:longTap];
}
-(void)imglongTapClick:(UILongPressGestureRecognizer*)gesture

{
    NSLog(@"p605p---%s---%@",__func__,@"longpress");
    if(gesture.state==UIGestureRecognizerStateBegan)
        
    {
        UIActionSheet*actionSheet = [[UIActionSheet alloc]initWithTitle:@"保存图片"delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"保存图片到手机",nil];
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackOpaque;
        [actionSheet showInView:self.view];
        
    }
    
}

- (void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:  (NSInteger)buttonIndex
{
    if(buttonIndex ==0) {
        UIImageWriteToSavedPhotosAlbum(imgV.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
}

- (void)imageSavedToPhotosAlbum:(UIImage*)image didFinishSavingWithError:  (NSError*)error contextInfo:(void*)contextInfo

{
    NSString*message =@"呵呵";
    if(!error) {
        message =@"成功保存到相册";
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        [alert show];
    }else
    {
        message = [error description];
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提    示"message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
