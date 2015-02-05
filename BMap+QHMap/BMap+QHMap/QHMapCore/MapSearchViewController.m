//
//  MapSearchViewController.m
//  weekend
//
<<<<<<< HEAD
//  Created by imqiuhang on 14/12/6.
//  Copyright (c) 2014年 imqiuhang. All rights reserved.
=======
//  Created by imqiuhang on 15/1/15.
//  Copyright (c) 2015年 your Co. Ltd. All rights reserved.
>>>>>>> master
//

#import "MapSearchViewController.h"
#import "BusInfoCell.h"
#import "ShowLineViewController.h"
#import "MSUtil.h"
#import "ListNoResultCell.h"
#import "ChooseLocationViewController.h"
#define btnPosition 70
#define btnHeigh 40
<<<<<<< HEAD
#define searchPosImgDefaultTag 999

typedef enum {
    mapNoResult   = 0,
    mapNone       = 1,
    mapBadNetWork = 2,
    mapBadService = 3
=======

#define searchImageTag  234324
typedef enum {
    mapNoResult=0,
    mapNone=1,
    mapBadNetWork=2,
    mapBadService=3
>>>>>>> master
}Maptype;

@interface MapSearchViewController ()<BMKRouteSearchDelegate,BMKGeoCodeSearchDelegate,BMKLocationServiceDelegate>
{
<<<<<<< HEAD
    UILabel            *startLable;
    UILabel            *destinationLable;
    NSArray            *showWayBtnChoosedImages;
    NSArray            *showWayBtnUnChooseImages;
    NSMutableArray     *showWayImageViews;
    NSMutableArray     *showWayDownLineView;
    UIImageView        *chooseCustomPositionImageView;
    UIButton           *chooseCustomPositionBtn;
    UIView             *topView;
    UIButton           *changeStartDestinationBtn;
    
    
    BOOL               firstIn;
    Maptype            maptype;
    searchType         mySearchType;
    BMKRouteSearch     *routeSearch;
    NSMutableArray     *routeInfo;
    NSMutableArray     *turnInfo;
    BMKGeoCodeSearch   *geocodesearch;
    NSString           *city;
    BMKLocationService *locService;
    
=======
    UILabel* startLable;
    UILabel*  endLable;
    NSArray*chooseImage;
    NSArray*unchooseImage;
    NSMutableArray*images;
    NSMutableArray*downLineView;
    UIImageView*searchPosImg;
    UIButton*chooseBtn;
    UIView*topView;
    UIButton*changePosBtn;

    BOOL firstIn;
    Maptype maptype;
    searchType mySearchType;
    BMKRouteSearch*routeSearch;
    NSMutableArray*routeInfo;
    NSMutableArray*turnInfo;
    NSArray*turnImage;
    BMKGeoCodeSearch* geocodesearch;
    NSString *city;
    BMKLocationService* locService;
  
>>>>>>> master
    
}
@end

@implementation MapSearchViewController

- (void)viewDidLoad {
<<<<<<< HEAD

    [super viewDidLoad];
    
    firstIn = YES;
    self.navigationController.navigationBar.alpha=1.0f;
    
    maptype      = mapNone;
    mySearchType = searchBus;
    
    [self initView];
    [self initLocation];
    routeSearch = [[BMKRouteSearch alloc] init];
    routeSearch.delegate = self;
    
    //当用户在地图中选择了起始位置会受到这个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadLocation:) name:@"USERLOCATIONCHANGED" object:nil];
}
#pragma mark init
- (void)initLocation {
    [self cusShowLoaingView];
    locService = [[BMKLocationService alloc] init];
    locService.delegate = self;
    [locService startUserLocationService];
    destinationLocation = [MapCommUtility locationToBaidu:self.mapSearchViewInfo.destinationLocation];
    
}

#pragma mark Events

- (void)reloadLocation:(NSNotification*)aNotification
{
    routeSearch.delegate   = self;
    geocodesearch.delegate = self;
    locService.delegate    = self;
    NSDictionary*curLocationInfo = aNotification.object;
    CustomMapLocation*curCusLoc  = curLocationInfo[@"location"];
    if (curLocationInfo[@"city"]!=nil) {
        city                  = curLocationInfo[@"city"];
    }
    if (chooseCustomPositionImageView.tag == searchPosImgDefaultTag) {
        startLocation         = curCusLoc.location;
        startLable.text       = curLocationInfo[@"locationTitle"];
    }else{
        destinationLocation   = curCusLoc.location;
        destinationLable.text = curLocationInfo[@"locationTitle"];
=======
    
    [super viewDidLoad];
    maptype=mapNone;
    mySearchType=searchBus;
    [self initView];
    [self initLocation];
    routeSearch=[[BMKRouteSearch alloc] init];
    routeSearch.delegate=self;
    
    //当用户在地图中选择了起始位置会受到这个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadLocation:) name:@"USERLOCATIONCHANGED" object:nil];
    
    turnImage=@[@"walk_turn_littleLeft",
                @"walk_turn_littleLeft",
                @"walk_turn_littleRight",
                @"walk_turn_littleRight",
                @"walk_turn_left",
                @"walk_turn_right",
                @"walk_turn_back",
                @"walk_turn_go",
                @"walk_turn_go",
                @"walk_turn_go",
                @"walk_turn_default"
                ];
    
}
#pragma mark init
- (void)initLocation
{
    [self cusShowLoaingView];
    locService=[[BMKLocationService alloc] init];
    locService.delegate=self;
    [locService startUserLocationService];
    CustomMapLocation*desLocation=self.info[@"location"];
    self->destinationCoordinate  =[MapCommUtility locationToBaidu:desLocation.location];
}

#pragma mark Events
//收到用户在地图上选择了新的起点通知event
-(void)reloadLocation:(NSNotification*) notification
{
    routeSearch.delegate=self;
    geocodesearch.delegate=self;
    locService.delegate=self;
    NSDictionary*curLocationInfo=notification.object;
    CustomMapLocation*curCusLoc=curLocationInfo[@"location"];
    if (curLocationInfo[@"city"]!=nil) {
        city=curLocationInfo[@"city"];
    }
    if (searchPosImg.tag==searchImageTag) {
        self->startCoordinate =curCusLoc.location;
        startLable.text=curLocationInfo[@"locationTitle"];
    }else{
        self->destinationCoordinate=curCusLoc.location;
        endLable.text=curLocationInfo[@"locationTitle"];;
>>>>>>> master
    }
    [self beginSearch];
}
-(void)getLocation{
    geocodesearch = [[BMKGeoCodeSearch alloc]init];
<<<<<<< HEAD
    geocodesearch.delegate = self;
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = startLocation;
    BOOL flag = [geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    
    if(flag) {
        MSLog(@"反geo检索发送成功");
    }else {
        MSLog(@"反geo检索发送失败");
        [self cusHideLoaingView];
        maptype = mapBadService;
        [self->dataTableView reloadData];
    }
    
}

-(void)changePos {
    CLLocationCoordinate2D curLocation = startLocation;
    startLocation            = destinationLocation;
    destinationLocation      = curLocation;
    
    NSString *curTitleString = startLable.text;
    startLable.text          = destinationLable.text;
    destinationLable.text            = curTitleString;
    
    [self->dataTableView reloadData];
    
    if (chooseCustomPositionImageView.tag==searchPosImgDefaultTag) {
        chooseCustomPositionImageView.tag = searchPosImgDefaultTag-1;
        chooseCustomPositionImageView.top += 30;
        chooseCustomPositionBtn.top       += 30;
    } else {
        chooseCustomPositionImageView.tag = searchPosImgDefaultTag;
        chooseCustomPositionImageView.top -= 30;
        chooseCustomPositionBtn.top       -= 30;
=======
    geocodesearch.delegate=self;
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = self->startCoordinate;
    BOOL flag = [geocodesearch reverseGeoCode:reverseGeocodeSearchOption];

    if(flag){
        NSLog(@"反geo检索发送成功");
    }
    else{
        NSLog(@"反geo检索发送失败");
        [self cusHideLoaingView];
        maptype=mapBadService;
        [self.dataTableView reloadData];
    }

}
//点击我的位置和目标位置切换按钮做的事情
-(void)changePos {
    CLLocationCoordinate2D curLocation=self->startCoordinate ;
    self->startCoordinate=self->destinationCoordinate;
    self->destinationCoordinate =curLocation;
    
    NSString *curTitleString=startLable.text;
    startLable.text=endLable.text;
    endLable.text=curTitleString;
    
    [self.dataTableView reloadData];
    
    if (searchPosImg.tag==searchImageTag) {
        searchPosImg.tag=searchImageTag-1;
        [searchPosImg setFrame:CGRectMake(searchPosImg.frame.origin.x, searchPosImg.frame.origin.y+30, searchPosImg.frame.size.width, searchPosImg.frame.size.height)];
        
        [chooseBtn setFrame:CGRectMake(chooseBtn.frame.origin.x, chooseBtn.frame.origin.y+30, chooseBtn.frame.size.width, chooseBtn.frame.size.height)];
    } else {
        searchPosImg.tag=searchImageTag;
        [searchPosImg setFrame:CGRectMake(searchPosImg.frame.origin.x, searchPosImg.frame.origin.y-30, searchPosImg.frame.size.width, searchPosImg.frame.size.height)];
        
        [chooseBtn setFrame:CGRectMake(chooseBtn.frame.origin.x, chooseBtn.frame.origin.y-30, chooseBtn.frame.size.width, chooseBtn.frame.size.height)];
>>>>>>> master
    }
    
    [self beginSearch];
}
<<<<<<< HEAD

- (void)chooseLocationInMap {
    ChooseLocationViewController *chooseView = [[ChooseLocationViewController alloc] init];
    chooseView.startLocation = startLocation;
    [self.navigationController pushViewController:chooseView animated:YES];
}

- (void)changeSearch:(UIButton*)sender {
    switch (sender.tag) {
        case 100:
            mySearchType = searchBus;
            break;
        case 101:
            mySearchType = searchWalk;
            break;
        case 102:
            mySearchType = searchCar;
=======
//点击从地图上选择位置按钮event
-(void)chooseLocationInMap
{
    ChooseLocationViewController*chooseView=[[ChooseLocationViewController alloc] init];
    chooseView.startCoordinate=self->startCoordinate;
    [self.navigationController pushViewController:chooseView animated:YES];
}
//更换搜索类型event
-(void)changeSearch:(UIButton*)sender
{
    switch (sender.tag) {
        case 100:
            mySearchType=searchBus;
            break;
        case 101:
            mySearchType=searchWalk;
            break;
        case 102:
            mySearchType=searchCar;
>>>>>>> master
            break;
        default:
            break;
    }
<<<<<<< HEAD
    for(int i=0;i<showWayImageViews.count;i++) {
        if(i == sender.tag-100) {
            UIImageView *cur_ImageView   = showWayImageViews[i];
            cur_ImageView.image          = [UIImage imageNamed:showWayBtnChoosedImages[i]];
            UIView*cur_lineView          = showWayDownLineView[i];
            cur_lineView.backgroundColor = [UIColor colorWithRed:122/255.0f green:124/255.0f blue:128/255.0f alpha:1.0f];
        }else {
            UIImageView *cur_ImageView   = showWayImageViews[i];
            cur_ImageView.image=[UIImage imageNamed:showWayBtnUnChooseImages[i]];
            
            UIView *cur_lineView         = showWayDownLineView[i];
            cur_lineView.backgroundColor = [UIColor clearColor];
            
        }
    }
=======
    for(int i=0;i<images.count;i++){
        if(i==sender.tag-100){
            UIImageView*cur_ImageView=images[i];
            [cur_ImageView setImage:[UIImage imageNamed:chooseImage[i]]];
            UIView*cur_lineView=downLineView[i];
            cur_lineView.backgroundColor= [UIColor colorWithRed:122/255.0f green:124/255.0f blue:128/255.0f alpha:1.0f];
        }
        else{
            UIImageView*cur_ImageView=images[i];
            [cur_ImageView setImage:[UIImage imageNamed:unchooseImage[i]]];
            
            UIView*cur_lineView=downLineView[i];
            cur_lineView.backgroundColor=[UIColor clearColor];
            
        }
    }
    

>>>>>>> master
    [self beginSearch];
}

#pragma mark -
#pragma searchEvent

<<<<<<< HEAD
- (void)beginSearch {
=======
-(void)beginSearch{
>>>>>>> master
    
    [self doReload];
    if (!firstIn) {
        [self cusShowLoaingView];
    }
<<<<<<< HEAD
    BMKPlanNode *start = [[BMKPlanNode alloc] init];
    BMKPlanNode *end   = [[BMKPlanNode alloc] init];
    start.pt = startLocation;
    end.pt   = destinationLocation;
    BOOL flag;
    switch (mySearchType) {
        case searchBus: {
            BMKTransitRoutePlanOption *transitRouteSearchOption = [[BMKTransitRoutePlanOption alloc]init];
            transitRouteSearchOption.city = city;
            transitRouteSearchOption.from = start;
            transitRouteSearchOption.to   = end;
=======
    BMKPlanNode*start=[[BMKPlanNode alloc] init];
    BMKPlanNode*end=[[BMKPlanNode alloc] init];
    start.pt=startCoordinate;
    end.pt=destinationCoordinate;
    BOOL flag;
    switch (mySearchType) {
        case searchBus:{
            BMKTransitRoutePlanOption *transitRouteSearchOption = [[BMKTransitRoutePlanOption alloc]init];
            transitRouteSearchOption.city=city;
            transitRouteSearchOption.from = start;
            transitRouteSearchOption.to = end;
>>>>>>> master
            flag = [routeSearch transitSearch:transitRouteSearchOption];
            
            break;
        }
<<<<<<< HEAD
        case searchWalk: {
            BMKWalkingRoutePlanOption *walkingRoutePlanOption = [[BMKWalkingRoutePlanOption alloc] init];
            walkingRoutePlanOption.from = start;
            walkingRoutePlanOption.to   = end;
            flag = [routeSearch walkingSearch:walkingRoutePlanOption];
            break;
        }
        case searchCar: {
            BMKDrivingRoutePlanOption*drivingRouteSearchOption = [[BMKDrivingRoutePlanOption alloc]init];
            drivingRouteSearchOption.from = start;
            drivingRouteSearchOption.to   = end;
=======
        case searchWalk:{
            BMKWalkingRoutePlanOption*walkingRoutePlanOption=[[BMKWalkingRoutePlanOption alloc] init];
            walkingRoutePlanOption.from = start;
            walkingRoutePlanOption.to = end;
            flag = [routeSearch walkingSearch:walkingRoutePlanOption];
            break;
        }
        case searchCar:{
            BMKDrivingRoutePlanOption*drivingRouteSearchOption=[[BMKDrivingRoutePlanOption alloc]init];
            drivingRouteSearchOption.from = start;
            drivingRouteSearchOption.to = end;
>>>>>>> master
            flag = [routeSearch drivingSearch:drivingRouteSearchOption];
            break;
        }
        default:
            break;
    }
    
<<<<<<< HEAD
    if(flag) {
        //搜索发起成功
        
    }else {
        //搜索发起失败
        [self cusHideLoaingView];
        maptype   = mapBadService;
        routeInfo = [[NSMutableArray alloc] init];
        [self->dataTableView reloadData];
=======
    if(flag){
        //搜索发起成功
        
    }else{
        //搜索发起失败
        [self cusHideLoaingView];
        maptype=mapBadService;
        routeInfo=[[NSMutableArray alloc] init];
        [self.dataTableView reloadData];
>>>>>>> master
    }
    
}
#pragma mark -
#pragma searchDelegate
<<<<<<< HEAD
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation {
    if (userLocation.location!=nil) {
        startLocation = userLocation.location.coordinate;
    }else{
        [locService startUserLocationService];
        MSLog(@"重新开始定位,如需处理请在此!");
    }
=======
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation{
//todo
    if (userLocation.location!=nil) {
        self->startCoordinate =userLocation.location.coordinate;
    }
    
>>>>>>> master
    [self getLocation];
    [locService stopUserLocationService];
}

<<<<<<< HEAD
- (void)didFailToLocateUserWithError:(NSError *)error {
    [locService startUserLocationService];
    MSLog(@"重新开始定位,如需处理请在此!");
=======
- (void)didFailToLocateUserWithError:(NSError *)error{
    //todo
    self->startCoordinate =CLLocationCoordinate2DMake(31.2434191659 , 121.4813312057);
   [locService stopUserLocationService];
    [self getLocation];
>>>>>>> master
}

- (void)onGetTransitRouteResult:(BMKRouteSearch*)searcher result:(BMKTransitRouteResult*)result errorCode:(BMKSearchErrorCode)error
{
    [self cusHideLoaingView];
    if (error == BMK_SEARCH_NO_ERROR) {
        [self getBusResult:result];
    }else{;
        maptype=mapNoResult;
<<<<<<< HEAD
        [self->dataTableView reloadData];
    }
    
}
- (void)onGetWalkingRouteResult:(BMKRouteSearch *)searcher result:(BMKWalkingRouteResult *)result errorCode:(BMKSearchErrorCode)error {
=======
        [self.dataTableView reloadData];
    }
    
}
-(void)onGetWalkingRouteResult:(BMKRouteSearch *)searcher result:(BMKWalkingRouteResult *)result errorCode:(BMKSearchErrorCode)error{
>>>>>>> master
    [self cusHideLoaingView];
    if (error == BMK_SEARCH_NO_ERROR) {
        [self getWalkResult:result];
    }else{
<<<<<<< HEAD
        
        maptype=mapNoResult;
        [self->dataTableView reloadData];
    }
}
- (void)onGetDrivingRouteResult:(BMKRouteSearch *)searcher result:(BMKDrivingRouteResult *)result errorCode:(BMKSearchErrorCode)error {
=======

        maptype=mapNoResult;
        [self.dataTableView reloadData];
    }
}
-(void)onGetDrivingRouteResult:(BMKRouteSearch *)searcher result:(BMKDrivingRouteResult *)result errorCode:(BMKSearchErrorCode)error{
>>>>>>> master
    [self cusHideLoaingView];
    if (error == BMK_SEARCH_NO_ERROR) {
        [self getCarResult:result];
    }else{
<<<<<<< HEAD
        maptype = mapNoResult;
        [self->dataTableView reloadData];
    }
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    [self cusHideLoaingView];
    firstIn = NO;
=======
        maptype=mapNoResult;
        [self.dataTableView reloadData];
    }
}

-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    [self cusHideLoaingView];
    firstIn=NO;
>>>>>>> master
    if (error == 0) {
        startLable.text = result.address;
        city=result.addressDetail.city;
        [self beginSearch];
    }else{
<<<<<<< HEAD
        startLable.text = @"定位失败";
        maptype = mapBadService;
        [self->dataTableView reloadData];
=======
        startLable.text=@"定位失败";
        maptype=mapBadService;
        [self.dataTableView reloadData];
>>>>>>> master
    }
}

#pragma mark -
#pragma mark searchData

<<<<<<< HEAD
- (void)getBusResult:(BMKTransitRouteResult*)result {
    
    routeInfo = [[NSMutableArray alloc] init];
    if (result.routes.count==0) {
        return ;
    }else {
        for(BMKTransitRouteLine* plan in result.routes) {
            
            NSMutableArray*busStopNameArr=[[NSMutableArray alloc] init];
            int busStopCount = 0;
            int distance     = plan.distance;
            BMKTime*time     = plan.duration;
            for (int i=0; i<plan.steps.count; i++) {
                BMKTransitStep* transitStep = [plan.steps objectAtIndex:i];
=======
-(void)getBusResult:(BMKTransitRouteResult*)result{
    
    routeInfo=[[NSMutableArray alloc] init];
    if (result.routes.count==0) {
        return ;
    }else{
        for(BMKTransitRouteLine* plan in result.routes){
            
            NSMutableArray*busStopNameArr=[[NSMutableArray alloc] init];
            int busStopCount=0;
            int distance=plan.distance;
            BMKTime*time=plan.duration;
            for (int i=0; i<plan.steps.count; i++) {
                BMKTransitStep* transitStep = [plan.steps objectAtIndex:i];
                
                
>>>>>>> master
                if (transitStep.stepType==BMK_BUSLINE ||transitStep.stepType==BMK_SUBWAY) {
                    [busStopNameArr addObject:transitStep.vehicleInfo.title];
                    busStopCount+=transitStep.vehicleInfo.passStationNum;
                }
            }
            
<<<<<<< HEAD
            NSString*busStopName = [busStopNameArr componentsJoinedByString:@"-"];
=======
            NSString*busStopName=[busStopNameArr componentsJoinedByString:@"-"];
>>>>>>> master
            NSDictionary*curResult=@{@"busStopName":busStopName,
                                     @"busStopCount":[NSString stringWithFormat:@"%i",busStopCount],
                                     @"distance":[NSString stringWithFormat:@"%@",[MSUtil covertDistance:distance]],
                                     @"time":time,
                                     @"plan":plan
                                     };
            [routeInfo addObject:curResult];
        }
        
    }
<<<<<<< HEAD
    [self->dataTableView reloadData];
}
- (void)getWalkResult:(BMKWalkingRouteResult*)result {
    routeInfo = [[NSMutableArray alloc] init];
    BMKWalkingRouteLine* plan = result.routes[0];//现在只返回一条
    int distance = plan.distance;
    BMKTime*time = plan.duration;
    //???   这里taxi都是0元 why
    //int taxiPrice=result.taxiInfo.totalPrice;
    int taxiPrice=10+(distance/1000)*3;
=======
    
    [self.dataTableView reloadData];
}
-(void)getWalkResult:(BMKWalkingRouteResult*)result{
    routeInfo=[[NSMutableArray alloc] init];
    BMKWalkingRouteLine* plan=result.routes[0];//现在只返回一条
    int distance=plan.distance;
    BMKTime*time=plan.duration;
    //int taxiPrice=result.taxiInfo.totalPrice;
    int taxiPrice=10+(distance/1000)*3;
    
>>>>>>> master
    NSDictionary*curResult=@{@"title":[NSString stringWithFormat:@"%@  %@",[self getTime:time],[MSUtil covertDistance:distance]],
                             @"taxiPrice":[NSString stringWithFormat:@"打车约%i元",taxiPrice],
                             @"plan":plan
                             };
    [routeInfo addObject:curResult];
<<<<<<< HEAD
    turnInfo = [[NSMutableArray alloc] init];
    for (int i=0; i<plan.steps.count; i++) {
        BMKWalkingStep* transitStep = [plan.steps objectAtIndex:i];
        [turnInfo addObject:transitStep.entraceInstruction];
    }
    [self->dataTableView reloadData];
    
}

- (void)getCarResult:(BMKDrivingRouteResult*)result {
    routeInfo=[[NSMutableArray alloc] init];
    BMKDrivingRouteLine* plan=result.routes[0];
    int distance=plan.distance;
    BMKTime*time=plan.duration;
=======
    turnInfo=[[NSMutableArray alloc] init];
    for (int i=0; i<plan.steps.count; i++){
        BMKWalkingStep* transitStep = [plan.steps objectAtIndex:i];
        [turnInfo addObject:transitStep.entraceInstruction];
    }
    [self.dataTableView reloadData];
    
}

-(void)getCarResult:(BMKDrivingRouteResult*)result{
    routeInfo=[[NSMutableArray alloc] init];
    BMKDrivingRouteLine* plan=result.routes[0];//现在只返回一条
    int distance=plan.distance;
    BMKTime*time=plan.duration;
    //int taxiPrice=result.taxiInfo.totalPrice;
    /*todo   这里taxi都是0元 why*/
>>>>>>> master
    int taxiPrice=10+(distance/1000)*3;
    NSDictionary*curResult=@{@"title":[NSString stringWithFormat:@"%@  %@",[self getTime:time],[MSUtil covertDistance:distance]],
                             @"taxiPrice":[NSString stringWithFormat:@"打车约%i元",taxiPrice],
                             @"plan":plan
                             };
    [routeInfo addObject:curResult];
<<<<<<< HEAD
    
=======
   
>>>>>>> master
    turnInfo=[[NSMutableArray alloc] init];
    for (int i=0; i<plan.steps.count; i++){
        BMKDrivingStep* transitStep = [plan.steps objectAtIndex:i];
        [turnInfo addObject:transitStep.entraceInstruction];
    }
<<<<<<< HEAD
    [self->dataTableView reloadData];
}

- (NSString*)getTime:(BMKTime*)bTime {
=======
    [self.dataTableView reloadData];
}

-(NSString*)getTime:(BMKTime*)bTime{
>>>>>>> master
    NSString*timeTip=@"";
    if (bTime.dates) {
        timeTip=[NSString stringWithFormat:@"%i天",bTime.dates];
    }
    if (bTime.hours) {
        timeTip=[NSString stringWithFormat:@"%@%i小时",timeTip,bTime.hours];
    }
    if (bTime.minutes) {
        timeTip=[NSString stringWithFormat:@"%@%i分钟",timeTip,bTime.minutes];
    }
    return timeTip;
}

<<<<<<< HEAD
- (UIImage*)getTurnImgeWithStr:(NSString*)turnStr {
    
    NSDictionary *turnImage=@{@"靠左":@"walk_turn_littleLeft",
                              @"左前":@"walk_turn_littleLeft",
                              @"靠右":@"walk_turn_littleRight",
                              @"右前":@"walk_turn_littleRight",
                              @"左转":@"walk_turn_left",
                              @"右转":@"walk_turn_right",
                              @"调头":@"walk_turn_back",
                              @"直行":@"walk_turn_go",
                              @"直走":@"walk_turn_go",
                              @"向前":@"walk_turn_go",
                              @"default":@"walk_turn_default"
                              };
    
    for(int i=0;i<turnImage.allKeys.count;i++){
        if([turnStr rangeOfString:turnImage.allKeys[i]].location!=NSNotFound){
            return [UIImage imageNamed:turnImage[turnImage.allKeys[i]]];
        }
    }
    return [UIImage imageNamed:turnImage[@"default"]];
}
#pragma mark -
#pragma mark TableViewDelegate
- (void)doReload {
    maptype   = mapNone;
    routeInfo = [[NSMutableArray alloc] init];
    turnInfo  = [[NSMutableArray alloc] init];
    [self->dataTableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (maptype!=mapNone||indexPath.section!=0) {
        return;
    }else {
        NSDictionary *curRouteDic = [routeInfo objectAtIndex:indexPath.row];
        NSString *subTitle;
        NSString *title;
        if (mySearchType==searchBus) {
            subTitle=[self getSubTitle:curRouteDic];
            title = curRouteDic[@"busStopName"];
        }else{
            subTitle = curRouteDic[@"taxiPrice"];
            title    = curRouteDic[@"title"];
        }
        ShowLineViewController *showLineView = [[ShowLineViewController alloc] init];
        showLineView.info = @{@"title":title,@"subTitle":subTitle,@"plan":curRouteDic[@"plan"]};
        showLineView.mySearchType = mySearchType;
=======
-(int)getTurnInfoWithStr:(NSString*)turnStr{


    NSArray*turnKey=@[@"靠左",@"左前",@"靠右",@"右前",@"左转",@"右转",@"调头",@"直行",@"直走",@"向前"];
    
    for(int i=0;i<turnKey.count;i++){
        if([turnStr rangeOfString:[turnKey objectAtIndex:i]].location !=NSNotFound){
            return i;
        }
    }
    return turnImage.count-1;
}
#pragma mark -
#pragma mark TableViewDelegate
-(void)doReload{
    maptype=mapNone;
    routeInfo=[[NSMutableArray alloc] init];
    turnInfo=[[NSMutableArray alloc] init];
    [self.dataTableView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (maptype!=mapNone||indexPath.section!=0) {
        return;
    }else{
        
        
        NSDictionary*curRouteDic=[routeInfo objectAtIndex:indexPath.row];
        NSString*subTitle;
        NSString*title;
        if (mySearchType==searchBus) {
            subTitle=[self getSubTitle:curRouteDic];
            title=curRouteDic[@"busStopName"];
        }else{
            subTitle=curRouteDic[@"taxiPrice"];
            title=curRouteDic[@"title"];
        }
        ShowLineViewController*showLineView=[[ShowLineViewController alloc] init];
        showLineView.info=@{@"title":title,@"subTitle":subTitle,@"plan":curRouteDic[@"plan"]};
        showLineView.mySearchType=mySearchType;
>>>>>>> master
        [self.navigationController pushViewController:showLineView animated:YES];
    }
    
}

<<<<<<< HEAD
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
=======
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
>>>>>>> master
    if (maptype==mapNone&&mySearchType!=searchBus) {
        return 2;
    }
    
    return 1;
}

<<<<<<< HEAD
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (maptype==mapNone) {
        if (section==0) {
            return routeInfo.count;
        }else {
=======
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (maptype==mapNone) {
        if (section==0) {
            return routeInfo.count;
        }else{
>>>>>>> master
            return turnInfo.count;
        }
        
    }else{
        return 1;
    }
}


<<<<<<< HEAD
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(maptype!=mapNone) {
        return self->dataTableView.height;
    }else {
        if (indexPath.section==0) {
            return 70;
        }else {
            return 30;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (maptype!=mapNone) {

        ListNoResultCell *noResultCell = [tableView ListNoResultCell];
        noResultCell.width = screenWidth;
        if (maptype==mapNoResult) {
            [noResultCell setInfo:MapNoResult position:screenHeight/4-50];
        }else if(maptype==mapBadNetWork) {
            [noResultCell setInfo:MapBadNetWork position:screenHeight/4-50];
        }else if(maptype==mapBadService) {
            [noResultCell setInfo:MapBadService position:screenHeight/4-50];
        }
=======
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(maptype!=mapNone){
        return self.dataTableView.height;
    }else{
        if (indexPath.section==0) {
            return 70;
        }else{
            return 30;
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (maptype!=mapNone) {
        
        ListNoResultCell *noResultCell =[tableView ListNoResultCell];
        noResultCell.width = screenWidth;
        if (maptype==mapNoResult) {
            [noResultCell setInfo:MapNoResult position:screenheight/4-50];
        }else if(maptype==mapBadNetWork){
            [noResultCell setInfo:MapBadNetWork position:screenheight/4-50];
        }else if(maptype==mapBadService){
            [noResultCell setInfo:MapBadService position:screenheight/4-50];
        }
        
>>>>>>> master
        return noResultCell;
    }
    if (indexPath.section==0) {
        BusInfoCell *cell=[tableView BusInfoCell];
        NSDictionary*curRouteDic=[routeInfo objectAtIndex:indexPath.row];
        if (mySearchType==searchBus) {
<<<<<<< HEAD
            cell.title.text      = curRouteDic[@"busStopName"];
            cell.subTitle.text   = [self getSubTitle:curRouteDic];
            cell.lineView.hidden = NO;
        }
        if (mySearchType==searchCar||mySearchType==searchWalk) {
            if (indexPath.section==0) {
                cell.title.text    = curRouteDic[@"title"];
                cell.subTitle.text = curRouteDic[@"taxiPrice"];
=======
            cell.title.text=curRouteDic[@"busStopName"];
            cell.subTitle.text=[self getSubTitle:curRouteDic];
            cell.lineView.hidden=NO;
        }
        if (mySearchType==searchCar||mySearchType==searchWalk) {
            if (indexPath.section==0) {
                cell.title.text=curRouteDic[@"title"];
                cell.subTitle.text=curRouteDic[@"taxiPrice"];
>>>>>>> master
                cell.lineView.hidden=YES;
            }
            
        }
<<<<<<< HEAD
        return cell;
    }else {
        static NSString *cellWithIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellWithIdentifier];
        if(nil==cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1   reuseIdentifier:cellWithIdentifier];
        }
        cell.textLabel.text          = [turnInfo objectAtIndex:indexPath.row];
        cell.textLabel.font          = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor     = titleLableColor;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 2;
        cell.imageView.image         = [self getTurnImgeWithStr:turnInfo[indexPath.row]];
        cell.selectionStyle          = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1&&turnInfo.count>0) {
        return 30.f;
    }
    return 0.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self->dataTableView.width, 30)];
    headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *headLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 20)];
    headLable.font      = [UIFont systemFontOfSize:14];
    headLable.text      = @"路线规划";
    headLable.textColor = titleLableColor;
    headLable.centerY   = headView.height/2;
=======
        
        return cell;
    }else{
        static NSString *cellWithIdentifier = @"Cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellWithIdentifier];
        if(nil==cell)
        {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1   reuseIdentifier:cellWithIdentifier];
        }
        
        cell.textLabel.text=[turnInfo objectAtIndex:indexPath.row];
        [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
        [cell.textLabel setTextColor:titleLableColor];
        //FIXME:UILineBreakModeWordWrap->NSLineBreakByWordWrapping 6.0废弃
        cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines=2;
        cell.imageView.image=[UIImage imageNamed:[turnImage objectAtIndex:[self getTurnInfoWithStr:[turnInfo objectAtIndex:indexPath.row]]]];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;

    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1&&turnInfo.count>0) {
        return 30.0f;
    }
    return 0.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.dataTableView.width, 30)];
    headView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UILabel*headLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 20)];
    [headLable setFont:[UIFont systemFontOfSize:14]];
    headLable.text=@"路线规划";
    [headLable setTextColor:titleLableColor];
    [headLable setCenterY:headView.height/2];
>>>>>>> master
    [headView addSubview:headLable];
    if (section==1&&turnInfo.count>0) {
        return headView;
    }
    return nil;
}
<<<<<<< HEAD
- (NSString*)getSubTitle:(NSDictionary*)subInfo {
    NSMutableArray*subTitleArr = [[NSMutableArray alloc] init];
    [subTitleArr addObject:[NSString stringWithFormat:@"总站数:%@",subInfo[@"busStopCount"]]];
    [subTitleArr addObject:[NSString stringWithFormat:@"大约用时:%@",[self getTime:subInfo[@"time"]]]];
    [subTitleArr addObject:[NSString stringWithFormat:@"距离%@米",subInfo[@"distance"]]];
    NSString*subTitle = [subTitleArr componentsJoinedByString:@" | "];
    return subTitle;
}

- (void)initView {
    
    self.view.BackgroundColor = [UIColor groupTableViewBackgroundColor];
    showWayBtnChoosedImages   = @[@"btnBus_choose",@"btnWalk_choose",@"btnCar_choose"];
    showWayBtnUnChooseImages = @[@"btnBus_unchoose",@"btnWalk_unchoose",@"btnCar_unchoose"];
    
    NSArray *btnTitleArr = @[@"公交",@"步行",@"自驾"];
    
    topView    = [[UIView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, 110)];
    startLable = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, screenWidth-100, 30)];
    destinationLable   = [[UILabel alloc]initWithFrame:CGRectMake(35, 45, screenWidth-100, 20)];
    chooseCustomPositionBtn  = [[UIButton alloc]initWithFrame:CGRectMake(35, 10, screenWidth-50, 30)];
    [chooseCustomPositionBtn addTarget:nil action:@selector(chooseLocationInMap) forControlEvents:UIControlEventTouchUpInside];
    
    startLable.Font                     = [UIFont systemFontOfSize:13];
    destinationLable.Font               = [UIFont systemFontOfSize:13];
    startLable.textColor                = titleLableColor;
    destinationLable.textColor          = subTitleLableColor;
    startLable.text                     = @"正在为您定位";
    
    destinationLable.text               = self.mapSearchViewInfo.destinationName;
    
    chooseCustomPositionImageView       = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth-70, 10, 40, 30)];
    chooseCustomPositionImageView.image = [UIImage imageNamed:@"searchPos"];
    chooseCustomPositionImageView.tag   = searchPosImgDefaultTag;
    changeStartDestinationBtn           = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 70)];
    
    [changeStartDestinationBtn addTarget:nil action:@selector(changePos) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *changePosImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 12, 22)];
    changePosImage.image        = [UIImage imageNamed:@"changePos"];
    topView.backgroundColor     = [UIColor whiteColor];
    UIImageView *topPointImage  = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 10, 52)];
    topPointImage.image         =[UIImage imageNamed:@"topPoint"];
    UIView *startToEndLineView  = [[UIView alloc]initWithFrame:CGRectMake(35, 40, screenWidth-50, 0.5)];
    startToEndLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splitbg"]];
    
    [topView addSubview:chooseCustomPositionImageView];
    [topView addSubview:startToEndLineView];
    [topView addSubview:startLable];
    [topView addSubview:destinationLable];
    [topView addSubview:chooseCustomPositionBtn];
    [topView addSubview:changeStartDestinationBtn];
    [topView addSubview:changePosImage];
    topView.layer.shadowColor  = [UIColor blackColor].CGColor;
    topView.layer.shadowRadius = 2.0f;
    
    [self.view addSubview:topView];
    
    showWayImageViews = [[NSMutableArray alloc]init];
    showWayDownLineView   = [[NSMutableArray alloc]init];
    UIView*btnView = [[UIView alloc]initWithFrame:CGRectMake(0, btnPosition, screenWidth, btnHeigh)];
    
    for(int i=0;i<btnTitleArr.count;i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i*(screenWidth/3), 0, screenWidth/3, 50)];
        btn.tag =i+100;
        [btn addTarget:self action:@selector(changeSearch:) forControlEvents:UIControlEventTouchUpInside];
        
        float positionX = screenWidth*(CGFloat)((2.0f*i+1.0f)/6.0f);
        UIImageView *cur_ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(positionX- 20 , 0, 40,40)];
        UIView *lineView;
        if (i==0) {
            lineView = [[UIView alloc ]initWithFrame:CGRectMake(5, 37, screenWidth/3.0f-5, 3)];
            cur_ImageView.image      = [UIImage imageNamed:showWayBtnChoosedImages[i]];
            lineView.backgroundColor = [UIColor colorWithRed:122/255.0f green:124/255.0f blue:128/255.0f alpha:1.0f];
            
        }else if (i==1) {
            lineView  =[[UIView alloc]initWithFrame:CGRectMake(screenWidth/3.0f, 37,screenWidth/3.0f, 3)];
            cur_ImageView.image      = [UIImage imageNamed:showWayBtnUnChooseImages[i]];
            lineView.backgroundColor = [UIColor clearColor];
            
        }else {
            lineView = [[UIView alloc ]initWithFrame:CGRectMake(2*screenWidth/3.0f, 37,screenWidth/3.0f-5,3)];
            cur_ImageView.image      = [UIImage imageNamed:showWayBtnUnChooseImages[i]];
            lineView.backgroundColor = [UIColor clearColor];
            
        }
        UIView*cutLineView = [[UIView alloc] initWithFrame:CGRectMake(i*screenWidth/3.0f, 5, 0.5, 30)];
        cutLineView.backgroundColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f];
        
        cur_ImageView.contentMode     = UIViewContentModeCenter;
        cur_ImageView.backgroundColor = [UIColor clearColor];
        [showWayImageViews addObject:cur_ImageView];
        
        UIView* topLineView = [[UIView alloc]initWithFrame:CGRectMake(0, -0.5, screenWidth, 0.5)];
        topLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splitbg"]];
        
        [btnView addSubview:btn];
        [btnView addSubview:topLineView];
        btnView.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1.0f];
        [btnView addSubview:lineView];
        [showWayDownLineView addObject:lineView];
=======
-(NSString*)getSubTitle:(NSDictionary*)subInfo{
    NSMutableArray*subTitleArr=[[NSMutableArray alloc] init];
    [subTitleArr addObject:[NSString stringWithFormat:@"总站数:%@",subInfo[@"busStopCount"]]];
    [subTitleArr addObject:[NSString stringWithFormat:@"大约用时:%@",[self getTime:subInfo[@"time"]]]];
    [subTitleArr addObject:[NSString stringWithFormat:@"距离%@米",subInfo[@"distance"]]];
    NSString*subTitle=[subTitleArr componentsJoinedByString:@" | "];
    return subTitle;
}
//初始化视图和tableView
-(void)initView
{
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    chooseImage=@[@"btnBus_choose",@"btnWalk_choose",@"btnCar_choose"];
    unchooseImage=@[@"btnBus_unchoose",@"btnWalk_unchoose",@"btnCar_unchoose"];
    
    topView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, 110)];
    NSArray*btnTitleArr=@[@"公交",@"步行",@"自驾"];
    startLable=[[UILabel alloc]initWithFrame:CGRectMake(35, 10, screenWidth-100, 30)];
    endLable=[[UILabel alloc]initWithFrame:CGRectMake(35, 45, screenWidth-100, 20)];
    chooseBtn=[[UIButton alloc]initWithFrame:CGRectMake(35, 10, screenWidth-50, 30)];
    [chooseBtn addTarget:nil action:@selector(chooseLocationInMap) forControlEvents:UIControlEventTouchUpInside];
    [startLable setFont:[UIFont systemFontOfSize:13]];
    [endLable setFont:[UIFont systemFontOfSize:12]];
    [startLable setTextColor:titleLableColor];
    [endLable setTextColor:subTitleLableColor];
    startLable.text= @"正在为您定位";
    endLable.text= self.info[@"address"];
    searchPosImg=[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth-70, 10, 40, 30)];
    [searchPosImg setImage:[UIImage imageNamed:@"searchPos"]];
    searchPosImg.tag=searchImageTag;
    changePosBtn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 70)];
    [changePosBtn addTarget:nil action:@selector(changePos) forControlEvents:UIControlEventTouchUpInside];
    UIImageView*changePosImage=[[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 12, 22)];
    [changePosImage setImage:[UIImage imageNamed:@"changePos"]];
    topView.backgroundColor=[UIColor whiteColor];
    UIImageView*topPointImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 10, 52)];
    UIView*startToEndLineView=[[UIView alloc]initWithFrame:CGRectMake(35, 40, screenWidth-50, 0.5)];
    [startToEndLineView setBackgroundColor:[UIColor splitlineGray]];
    [topView addSubview:searchPosImg];
    [topView addSubview:startToEndLineView];
    [topPointImage setImage:[UIImage imageNamed:@"topPoint"]];
    //[topView addSubview:topPointImage];
    [topView addSubview:startLable];
    [topView addSubview:endLable];
    [topView addSubview:chooseBtn];
    [topView addSubview:changePosBtn];
    [topView addSubview:changePosImage];
    topView.layer.shadowColor=[UIColor blackColor].CGColor;
    topView.layer.shadowRadius=2.0f;
    [self.view addSubview:topView];
    
    
    images=[[NSMutableArray alloc]init];
    
    downLineView=[[NSMutableArray alloc]init];
    UIView*btnView=[[UIView alloc]initWithFrame:CGRectMake(0, btnPosition, screenWidth, btnHeigh)];
    for(int i=0;i<btnTitleArr.count;i++)
    {
        UIButton*btn=[[UIButton alloc] initWithFrame:CGRectMake(i*(screenWidth/3), 0, screenWidth/3, 50)];
        btn.tag=i+100;
        [btn addTarget:self action:@selector(changeSearch:) forControlEvents:UIControlEventTouchUpInside];
        float positionX=screenWidth*(CGFloat)((2.0f*i+1.0f)/6.0f);
        UIImageView *cur_ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(positionX- 20 , 0, 40,40)];
        //[btn setBackgroundColor:[UIColor blackColor]];
        UIView*lineView;
        if (i==0) {
            lineView=[[UIView alloc ]initWithFrame:CGRectMake(5, 37, screenWidth/3.0f-5, 3)];
            [cur_ImageView setImage:[UIImage imageNamed:chooseImage[i]]];
            lineView.backgroundColor=[UIColor colorWithRed:122/255.0f green:124/255.0f blue:128/255.0f alpha:1.0f];
            
        }
        else if (i==1){
            lineView=[[UIView alloc ]initWithFrame:CGRectMake(screenWidth/3.0f, 37, screenWidth/3.0f, 3)];
            [cur_ImageView setImage:[UIImage imageNamed:unchooseImage[i]]];
            lineView.backgroundColor=[UIColor clearColor];
            
        }
        else{
            lineView=[[UIView alloc ]initWithFrame:CGRectMake(2*screenWidth/3.0f, 37, screenWidth/3.0f-5, 3)];
            [cur_ImageView setImage:[UIImage imageNamed:unchooseImage[i]]];
            lineView.backgroundColor=[UIColor clearColor];
            
        }
        UIView*cutLineView=[[UIView alloc] initWithFrame:CGRectMake(i*screenWidth/3.0f, 5, 0.5, 30)];
        cutLineView.backgroundColor=[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f];
        
        cur_ImageView.contentMode=UIViewContentModeCenter;
        [cur_ImageView setBackgroundColor:[UIColor clearColor]];
        
        [images addObject:cur_ImageView];
        UIView*topLineView=[[UIView alloc]initWithFrame:CGRectMake(0, -0.5, screenWidth, 0.5)];
        [topLineView setBackgroundColor:[UIColor splitlineGray]];
        [btnView addSubview:btn];
        [btnView addSubview:topLineView];
        btnView.backgroundColor=[UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1.0f];
        
        [btnView addSubview:lineView];
        [downLineView addObject:lineView];
>>>>>>> master
        [btnView addSubview:cur_ImageView];
        [btnView addSubview:cutLineView];
        
    }
    
<<<<<<< HEAD
    self->dataTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 184, screenWidth, screenHeight-164)];
    dataTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    dataTableView.delegate        = self;
    dataTableView.dataSource      = self;
    dataTableView.backgroundColor = [UIColor whiteColor];
    
    [topView addSubview:btnView];
    [self.view addSubview:dataTableView];
    
}

- (void)back {
    if(self.mapSearchViewInfo.isFromCell) {
        self.navigationController.navigationBar.alpha = 0;
    } else {
        self.navigationController.navigationBar.alpha = 1.f;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    routeSearch.delegate   = nil;
    geocodesearch.delegate = nil;
    locService.delegate    = nil;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    routeSearch.delegate   = self;
    geocodesearch.delegate = self;
    locService.delegate    = self;
=======
    self.dataTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 184, screenWidth, screenheight-164)];
    
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.dataTableView setDelegate:self];
    [self.dataTableView setDataSource:self];
    self.dataTableView.backgroundColor=[UIColor whiteColor];

    [topView addSubview:btnView];
   
    [self.view addSubview:self.dataTableView];
    
}

-(void)back
{

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    routeSearch.delegate=nil;
    geocodesearch.delegate=nil;
    locService.delegate=nil;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    routeSearch.delegate=self;
    geocodesearch.delegate=self;
    locService.delegate=self;
>>>>>>> master
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
<<<<<<< HEAD
- (void)dealloc {
    routeSearch.delegate   = nil;
    routeSearch            = nil;
    geocodesearch.delegate = nil;
    geocodesearch          = nil;
    locService.delegate    = nil;
    locService             = nil;
    MSLog(@"mapSearchView dealloc");
}
@end

@implementation MapSearchViewInfo

+ (instancetype)mapSearchViewInfoMakeWithName:(NSString *)aDestinationName andLocation:(CLLocationCoordinate2D)aDestinationLocation andIsFromCell:(BOOL)aIsFromCell andRemarkInfo:(MapSearchViewInfo *)aRemarkInfo {
    
    MapSearchViewInfo*mapSearchViewInfo   = [[MapSearchViewInfo alloc] init];
    mapSearchViewInfo.destinationName     = aDestinationName;
    mapSearchViewInfo.destinationLocation = aDestinationLocation;
    mapSearchViewInfo.isFromCell          = aIsFromCell;
    mapSearchViewInfo.remarkInfo          = aRemarkInfo;
    return mapSearchViewInfo;
}


=======
-(void)dealloc{
    routeSearch.delegate=nil;
    routeSearch=nil;
    geocodesearch.delegate=nil;
    geocodesearch=nil;
    locService.delegate=nil;
    locService=nil;
    NSLog(@"mapSearchView dealloc");
}
>>>>>>> master
@end
