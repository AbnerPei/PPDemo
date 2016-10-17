//
//  PPFaceAwareFillViewController.m
//  PPDemos
//
//  Created by Abner on 2016/10/17.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPFaceAwareFillViewController.h"

@interface PPFaceAwareFillViewController ()
{
    UIView *panelView;
    UIPageControl *pageControls;
    UIStepper *uistepper;
}
/** 图片views */
@property(nonatomic,strong)NSMutableArray<UIImageView *> *imageViews;
/** 图片名 */
@property(nonatomic,strong)NSMutableArray<NSString *> *imagesNames;

@end

@implementation PPFaceAwareFillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor pp_peacockBlueColor];
    
    _imageViews = [NSMutableArray array];
    _imagesNames = [NSMutableArray array];
    
    for (int i = 1; i<10; i++) {
        NSString *str = [NSString stringWithFormat:@"photo%d.jpg",i];
        [_imagesNames addObject:str];
    }
    CGFloat panelViewW = ScreenWidth-20;
    CGFloat imgVW = panelViewW/2-15;
    panelView = [[UIView alloc]initWithFrame:CGRectMake(10, 94, panelViewW, imgVW*2+30*2+10)];
    [self.view addSubview:panelView];
    panelView.layer.borderWidth = 0.5;
    panelView.layer.borderColor = [UIColor blackColor].CGColor;
    panelView.layer.cornerRadius = 4;
    panelView.clipsToBounds = YES;
    panelView.backgroundColor = [UIColor lightGrayColor];
    
    
   
    NSInteger lbCount = -1;
    for (int i=0; i<2; i++) {
        for (int j=0; j<2; j++) {
            UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(10+(imgVW+10)*i, 10+(imgVW+30)*j, imgVW, imgVW)];
//            imv.image = [UIImage imageNamed:_imagesNames[0]];
            UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(10+(imgVW+10)*i, 10+imgVW*(j+1)+30*j, imgVW, 30)];
            lb.textAlignment = NSTextAlignmentCenter;
            lb.font = [UIFont systemFontOfSize:20];
            lb.textColor = [UIColor whiteColor];
            imv.layer.borderColor = [UIColor whiteColor].CGColor;
            imv.layer.borderWidth = 0.5;
            imv.layer.cornerRadius = 4;
            imv.clipsToBounds = YES;
            [panelView addSubview:imv];
            [panelView addSubview:lb];
            lbCount++;
            if (lbCount >= 0) {
                switch (lbCount) {
                    case 0:
                    {
                        lb.text = @"Scale To Fill";
                        imv.contentMode = UIViewContentModeScaleToFill;
                        
                    }
                        break;
                    case 1:
                    {
                        lb.text = @"Aspect Filt";
                        imv.contentMode = UIViewContentModeScaleAspectFit;
                    }
                        break;
                    case 2:
                    {
                        lb.text = @"Aspect Fill";
                        imv.contentMode = UIViewContentModeScaleAspectFill;
                    }
                        break;
                    case 3:
                    {
                        lb.text = @"Face Aware";
                        [imv pp_faceAwareFill];
                    }
                        break;

                        
                    default:
                        break;
                }
            }
            
             [_imageViews addObject:imv];
        }
    }

   
    CGFloat pageControlY = imgVW*2+30*2+10+94;
    pageControls = [[UIPageControl alloc]init];
    pageControls.frame = CGRectMake(0, pageControlY + 20, ScreenWidth, 20);
    [self.view addSubview:pageControls];
    pageControls.numberOfPages = _imagesNames.count;
    
    uistepper = [[UIStepper alloc]initWithFrame:CGRectMake(ScreenWidth/2-50, pageControlY+40+10, 100, 40)];
    [self.view addSubview:uistepper];
    uistepper.maximumValue = _imagesNames.count-1;
    uistepper.value = 0;
    uistepper.autorepeat = NO;
    
   
    [uistepper addTarget:self action:@selector(onUIStepperValueChange:) forControlEvents:UIControlEventTouchUpInside];
    
    [self onUIStepperValueChange:uistepper];
}

- (void)onUIStepperValueChange:(UIStepper *)sender {
    
    UIImage* image = [UIImage imageNamed:[_imagesNames objectAtIndex:sender.value]];
    
    for (UIImageView* imv in _imageViews) {
        imv.image = image;
    }
    
    pageControls.currentPage = sender.value;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
