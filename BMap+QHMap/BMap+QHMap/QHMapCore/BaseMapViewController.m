//
//  BaseMapViewController.m
//  AmapTest
//
<<<<<<< HEAD
//  Created by imqiuhang on 14/11/14.
//  Copyright (c) 2014年 imqiuhang. All rights reserved.
=======
//  Created by imqiuhang on 15/1/15.
//  Copyright (c) 2015年 your Co. Ltd. All rights reserved.
>>>>>>> master
//

#import "BaseMapViewController.h"
#import "MSUtil.h"
@interface BaseMapViewController ()
<<<<<<< HEAD
{
    UIView *container;
}
@end

@implementation BaseMapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initLoaingView];
=======

@end

@implementation BaseMapViewController
{
    UIView*container;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    screenheight = [[UIScreen mainScreen] bounds].size.height-20;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initLoaingView];
    // Do any additional setup after loading the view.
>>>>>>> master
}

#
#pragma mark 各种初实例始化

<<<<<<< HEAD
-(void)initLoaingView{
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-44)];
    [container setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
    
    UIView *cusloadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapLoading"]];
    [cusloadingView setFrame:CGRectMake(5, 3, 30, 30)];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation                     = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue             = [NSNumber numberWithFloat: M_PI * 2.0 ];
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.duration            = 1;
    rotationAnimation.RepeatCount         = 100000;
    rotationAnimation.cumulative          = NO;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode            = kCAFillModeForwards;
    cusloadingView.centerX                = container.width/2;
    cusloadingView.centerY                = container.height/2;
=======


-(void)initLoaingView{
    container = [[UIView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenheight-44)];
    [container setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
    UIView* cusloadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mapLoading"]];
    [cusloadingView setFrame:CGRectMake(5, 3, 30, 30)];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.duration = 1;
    rotationAnimation.RepeatCount = 100000;
    rotationAnimation.cumulative = NO;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    [cusloadingView setCenterX:container.width/2];
    [cusloadingView setCenterY:container.height/2];
>>>>>>> master
    [container addSubview:cusloadingView];
    
    [cusloadingView.layer addAnimation:rotationAnimation forKey:@"Rotation"];
    
<<<<<<< HEAD
    UILabel*loadingLabel         = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 120, 20)];
    loadingLabel.font            = [UIFont systemFontOfSize:12];
    loadingLabel.backgroundColor = [UIColor clearColor];
    loadingLabel.textColor       = [UIColor lightGrayColor];
    loadingLabel.textAlignment   = NSTextAlignmentCenter;
    loadingLabel.text            = @"拼命加载中...";
    loadingLabel.centerX         = container.width/2;
    loadingLabel.top             = cusloadingView.bottom+10;
    [container addSubview:loadingLabel];
    
}

- (void)cusShowLoaingView {
    [self cusHideLoaingView];
    [self.view addSubview:container];
}

- (void)cusHideLoaingView {
    [container removeFromSuperview];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


=======
    UILabel*loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 120, 20)];
    [loadingLabel setFont:[UIFont systemFontOfSize:12]];
    [loadingLabel setBackgroundColor:[UIColor clearColor]];
    [loadingLabel setTextColor:[UIColor lightGrayColor]];
    loadingLabel.textAlignment=NSTextAlignmentCenter;
    [loadingLabel setText:@"拼命加载中..."];
    [loadingLabel setCenterX:container.width/2];
    [loadingLabel setTop:cusloadingView.bottom+10];
    [container addSubview:loadingLabel];

}
-(void)cusShowLoaingView{
   [self cusHideLoaingView];
   [self.view addSubview:container];
}
-(void)cusHideLoaingView{
    [container removeFromSuperview];
}

#pragma mark view did
-(void)back
{

    [self.navigationController popViewControllerAnimated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




>>>>>>> master
@end
