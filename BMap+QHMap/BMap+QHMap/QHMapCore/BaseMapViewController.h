//
//  BaseMapViewController.h
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

#import <UIKit/UIKit.h>
#import "BMapKit.h"
<<<<<<< HEAD
#import "UIView+QHUiViewCtg.h"
#import "MapCommUtility.h"
#import "CAdefine.h"
=======
#import "MapCommUtility.h"
#import "UIView+QHUiViewCtg.h"
#import "CAdefine.h"

>>>>>>> master
typedef enum {
    searchBus,
    searchWalk,
    searchCar
<<<<<<< HEAD
}searchType;

@interface BaseMapViewController :UIViewController
{
    UITableView *dataTableView;
}
- (void)cusShowLoaingView;
- (void)cusHideLoaingView;
=======

}searchType;
@interface BaseMapViewController : UIViewController
{
    float screenWidth;
    float screenheight;
}

@property(nonatomic,strong)UITableView *dataTableView;
-(void)cusShowLoaingView;
-(void)cusHideLoaingView;
>>>>>>> master
@end
