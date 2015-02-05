//
//  MapSearchViewController.h
//  weekend
//
<<<<<<< HEAD
//  Created by imqiuhang on 14/12/6.
//  fix by caomei on 12/01/28
//  Copyright (c) 2014年 imqiuhang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseMapViewController.h"

@interface MapSearchViewInfo :NSObject

@property (nonatomic,copy  ) NSString               * destinationName;
@property (nonatomic,assign) CLLocationCoordinate2D destinationLocation;
@property (nonatomic,assign) BOOL                   isFromCell;
@property (nonatomic,strong) MapSearchViewInfo      *remarkInfo;
/**
 *  跳转之前存储的目的地信息,出发地信息不需填,通过定位获取
 *
 *  @param aDestinationName     目的地地址或者名称
 *  @param aDestinationLocation 目的地经纬度
 *  @param aIsFromCell          是否来自cell
 *  @param aRemarkInfo          备注信息 可nil
 *
 *  @return MapSearchViewInfo
 */
+ (instancetype)mapSearchViewInfoMakeWithName:(NSString*)aDestinationName
                                  andLocation:(CLLocationCoordinate2D)aDestinationLocation
                                andIsFromCell:(BOOL)aIsFromCell
                                andRemarkInfo:(MapSearchViewInfo*)aRemarkInfo;
@end


@interface MapSearchViewController :  BaseMapViewController<UITableViewDataSource,UITableViewDelegate>
{
@protected
    CLLocationCoordinate2D startLocation;
    CLLocationCoordinate2D destinationLocation;
}
@property (nonatomic,strong)MapSearchViewInfo*mapSearchViewInfo;
=======
//  Created by imqiuhang on 15/1/15.
//  Copyright (c) 2015年 your Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseMapViewController.h"
@interface MapSearchViewController :  BaseMapViewController<UITableViewDataSource,UITableViewDelegate>
{
  @private
    CLLocationCoordinate2D startCoordinate;
    CLLocationCoordinate2D destinationCoordinate;
}
/**
 *  title & CustomMapLocation
 *  @{@"location":[CustomMapLocation customLocationMakeWithCLL:CLLocationCoordinate2DMake(30.2240510426, 120.124415001)],@"title":@"杭州西湖",@"address":@"杭州市西湖区"};
 */
@property(strong ,nonatomic)NSDictionary*info;

>>>>>>> master
@end
