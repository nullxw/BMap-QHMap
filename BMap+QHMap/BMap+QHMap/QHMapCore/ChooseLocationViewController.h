//
//  ChooseLocationViewController.h
//  AmapTest
//
<<<<<<< HEAD
//  Created by imqiuhang on 14/11/16.
//  Copyright (c) 2014年 imqiuhang. All rights reserved.
=======
//  Created by imqiuhang on 15/1/15.
//  Copyright (c) 2015年 your Co. Ltd. All rights reserved.
>>>>>>> master
//

#import <UIKit/UIKit.h>
#import "BaseMapViewController.h"
@interface ChooseLocationViewController : BaseMapViewController
/**
<<<<<<< HEAD
 *  开始定位到定位成功前展示在地图区域的位置坐标,如果不给默认展示的背景天安门
 */
@property (nonatomic) CLLocationCoordinate2D startLocation;
=======
 *  传入定位成功之前需要显示的坐标,如果不传 则在定位成功前显示的是北京
 */
@property(nonatomic,assign) CLLocationCoordinate2D startCoordinate;
>>>>>>> master

@end
