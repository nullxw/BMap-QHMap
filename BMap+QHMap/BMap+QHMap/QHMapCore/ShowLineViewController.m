//
//  ShowLineViewController.m
//  AmapTest
//
<<<<<<< HEAD
//  Created by imqiuhang on 14/11/15.
//  Copyright (c) 2014年 imqiuhang. All rights reserved.
=======
//  Created by imqiuhang on 15/1/15.
//  Copyright (c) 2015年 your Co. Ltd. All rights reserved.
>>>>>>> master
//

#import "ShowLineViewController.h"
#import "DDAnnotation.h"
#import "CustomMapAnnView.h"
#import "DDAnnotation.h"
<<<<<<< HEAD
#define startStr         @"起点"
#define endStr           @"终点"
#define botomViewDownTag 999
#define botomViewTopTag  1000
#define mapLogoPoint     CGPointMake(30, 10)
#define topViewMaxMove   (240-70)
#define botomGestureViewDefaultCenterY (screenHeight+20-70)

@interface ShowLineViewController ()<UITableViewDataSource,UITableViewDelegate,BMKMapViewDelegate>
{
    NSDictionary   *curAnnInfo;
    UIView         *botomView;
    UIImageView    *downOrUpImageView;
    BMKMapView     *mapView;
    NSMutableArray *planArr;
    NSMutableArray *annmations;
    UIView         *notifiView;
    UIView         *botomGestureView;
    CGPoint        botomViewDefaultCenter;
    CGPoint        beganGestureStatus;
=======
#define startStr                       @"起点"
#define endStr                         @"终点"
#define botomViewDownTag               999
#define botomViewTopTag                1000
#define mapLogoPoint                   CGPointMake(30, 10)
#define botomGestureViewDefaultCenterY       (screenheight+20-70)
#define topViewMaxMove                 (240-70)
@interface ShowLineViewController ()<UITableViewDataSource,UITableViewDelegate,BMKMapViewDelegate>
{
    NSDictionary *curAnnInfo;
    UIView*botomView;
    UIImageView*showMoreImage;
    BMKMapView*mapView;
    NSMutableArray*planArr;
    NSMutableArray*annmations;
    UIView*notifiView;
    UIView*botomGestureView;
    CGPoint botomViewDefaultCenter;
    CGPoint beganGestureStatus;
>>>>>>> master
}
@end

@implementation ShowLineViewController

- (void)viewDidLoad {
<<<<<<< HEAD
    
    [super viewDidLoad];
    
    mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-44)];
    mapView.delegate = self;
=======
    [super viewDidLoad];
    mapView=[[BMKMapView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenheight-44)];
    mapView.delegate=self;
>>>>>>> master
    [self.view addSubview:mapView];
    
    [self initTableView];
    [self loadData];
<<<<<<< HEAD
}

- (void)loadData {
    planArr    = [[NSMutableArray alloc] init];
    annmations = [[NSMutableArray alloc] init];
    
    if (self.mySearchType==searchBus) {
        [self setBusAnn];
    }else if(self.mySearchType==searchWalk) {
        [self setWalkAnn];
    }else {
=======
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    planArr=[[NSMutableArray alloc] init];
    annmations=[[NSMutableArray alloc] init];
    if (self.mySearchType==searchBus) {
        [self setBusAnn];
    }else if(self.mySearchType==searchWalk){
        [self setWalkAnn];
    }else{
>>>>>>> master
        [self setCarAnn];
    }
}

<<<<<<< HEAD
- (void)setBusAnn {
    BMKTransitRouteLine *plan = self.info[@"plan"];
    int planPointCounts       = 0;
    for (int i=0; i<plan.steps.count; i++) {
        if (i==0) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.starting.location;
            ann.title        = startStr;
            ann.customInfo   = @{@"image":@"pos_start"};
            [annmations addObject:ann];
        }
        if (i==plan.steps.count-1) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.terminal.location;
            ann.title        = endStr;
            ann.customInfo   = @{@"image":@"pos_end"};
            [annmations addObject:ann];
        }
        
        BMKTransitStep *transitStep = [plan.steps objectAtIndex:i];
        [planArr addObject:[MapCommUtility removeFormatWithStr:transitStep.instruction]];
        
        if (transitStep.stepType==BMK_BUSLINE ||transitStep.stepType==BMK_SUBWAY) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = transitStep.entrace.location;;
            ann.title        = transitStep.vehicleInfo.title;
            ann.subtitle     = [MapCommUtility removeFormatWithStr:transitStep.instruction];
            ann.customInfo=@{@"image":@"pos_bus"};
            [annmations addObject:ann];
        }else {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.title        = [MapCommUtility removeFormatWithStr:transitStep.instruction];
            ann.coordinate   = transitStep.entrace.location;;
            ann.customInfo   = @{@"image":@"pos_walk"};
            [annmations addObject:ann];
        }
        planPointCounts += transitStep.pointsCount;
    }
=======

-(void)setBusAnn{
        BMKTransitRouteLine* plan =self.info[@"plan"];
        int planPointCounts = 0;
        for (int i=0; i<plan.steps.count; i++) {
            if (i==0) {
                DDAnnotation*ann=[[DDAnnotation alloc] init];
                ann.coordinate=plan.starting.location;
                ann.title=startStr;
                ann.customInfo=@{@"image":@"pos_start"};
                [annmations addObject:ann];
            }
            if (i==plan.steps.count-1) {
                DDAnnotation*ann=[[DDAnnotation alloc] init];
                ann.coordinate=plan.terminal.location;
                ann.title=endStr;
                ann.customInfo=@{@"image":@"pos_end"};
                [annmations addObject:ann];
            }
            
            BMKTransitStep* transitStep = [plan.steps objectAtIndex:i];
            [planArr addObject:[MapCommUtility removeFormatWithStr:transitStep.instruction]];
            if (transitStep.stepType==BMK_BUSLINE ||transitStep.stepType==BMK_SUBWAY) {
                DDAnnotation*ann=[[DDAnnotation alloc] init];
                ann.coordinate=transitStep.entrace.location;;
                ann.title=transitStep.vehicleInfo.title;
                ann.subtitle=[MapCommUtility removeFormatWithStr:transitStep.instruction];
                ann.customInfo=@{@"image":@"pos_bus"};
                [annmations addObject:ann];
            }else{
                DDAnnotation*ann=[[DDAnnotation alloc] init];
                ann.title=[MapCommUtility removeFormatWithStr:transitStep.instruction];
                ann.coordinate=transitStep.entrace.location;;
                ann.customInfo=@{@"image":@"pos_walk"};
                [annmations addObject:ann];
            }
             planPointCounts += transitStep.pointsCount;
        }
>>>>>>> master
    BMKMapPoint  temppoints[planPointCounts];
    int i = 0;
    for (int j = 0; j < plan.steps.count; j++) {
        BMKTransitStep* transitStep = [plan.steps objectAtIndex:j];
<<<<<<< HEAD
        int k = 0;
=======
        int k=0;
>>>>>>> master
        for(k=0;k<transitStep.pointsCount;k++) {
            temppoints[i].x = transitStep.points[k].x;
            temppoints[i].y = transitStep.points[k].y;
            i++;
        }
        
    }
<<<<<<< HEAD
    BMKPolyline *polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
=======
    BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
>>>>>>> master
    [mapView addOverlay:polyLine];
    
    [mapView addAnnotations:annmations];
    BMKCoordinateRegion region;
    region = [MapCommUtility regionForAnnotations:mapView.annotations];
    [mapView setRegion:region];
    [mapView regionThatFits:region];
<<<<<<< HEAD
    [dataTableView reloadData];
    
}

- (void)setWalkAnn {
    BMKWalkingRouteLine *plan = self.info[@"plan"];
    int planPointCounts = 0;
    
    for (int i=0; i<plan.steps.count; i++) {
        if (i==0) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.starting.location;
            ann.title        = startStr;
            ann.customInfo   = @{@"image":@"pos_start"};
            [annmations addObject:ann];
        }
        
        BMKWalkingStep *transitStep = [plan.steps objectAtIndex:i];
        [planArr addObject:[MapCommUtility removeFormatWithStr:transitStep.instruction]];
        
        DDAnnotation*ann = [[DDAnnotation alloc] init];
        ann.title        = [MapCommUtility removeFormatWithStr:transitStep.instruction];
        ann.coordinate   = transitStep.entrace.location;
        ann.customInfo   = @{@"image":@"pos_walk_small"};
        [annmations addObject:ann];
        
        if (i==plan.steps.count-1) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.terminal.location;
            ann.title        = endStr;
            ann.customInfo   = @{@"image":@"pos_end"};
=======
    [self.dataTableView reloadData];
    
}

-(void)setWalkAnn{
    BMKWalkingRouteLine* plan =self.info[@"plan"];
    int planPointCounts = 0;
    for (int i=0; i<plan.steps.count; i++) {
        if (i==0) {
            DDAnnotation*ann=[[DDAnnotation alloc] init];
            ann.coordinate=plan.starting.location;
            ann.title=startStr;
            ann.customInfo=@{@"image":@"pos_start"};
            [annmations addObject:ann];
        }

        
        BMKWalkingStep* transitStep = [plan.steps objectAtIndex:i];
        [planArr addObject:[MapCommUtility removeFormatWithStr:transitStep.instruction]];
        
            DDAnnotation*ann=[[DDAnnotation alloc] init];
            ann.title=[MapCommUtility removeFormatWithStr:transitStep.instruction];
            ann.coordinate=transitStep.entrace.location;;
            ann.customInfo=@{@"image":@"pos_walk_small"};
            [annmations addObject:ann];
        
        if (i==plan.steps.count-1) {
            DDAnnotation*ann=[[DDAnnotation alloc] init];
            ann.coordinate=plan.terminal.location;
            ann.title=endStr;
            ann.customInfo=@{@"image":@"pos_end"};
>>>>>>> master
            [annmations addObject:ann];
        }
        planPointCounts += transitStep.pointsCount;
        
    }
    BMKMapPoint  temppoints[planPointCounts];
    int i = 0;
    for (int j = 0; j < plan.steps.count; j++) {
        BMKWalkingStep* transitStep = [plan.steps objectAtIndex:j];
        int k=0;
        for(k=0;k<transitStep.pointsCount;k++) {
            temppoints[i].x = transitStep.points[k].x;
            temppoints[i].y = transitStep.points[k].y;
            i++;
        }
        
    }
<<<<<<< HEAD
    BMKPolyline *polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
=======
    BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
>>>>>>> master
    [mapView addOverlay:polyLine];
    
    [mapView addAnnotations:annmations];
    BMKCoordinateRegion region;
    
    region = [MapCommUtility regionForCarAnnotations:annmations];
<<<<<<< HEAD
    
    [mapView setRegion:region];
    [mapView regionThatFits:region];
    [dataTableView reloadData];
    
}
-(void)setCarAnn{
    BMKDrivingRouteLine *plan =self.info[@"plan"];
    int planPointCounts = 0;
    for (int i=0; i<plan.steps.count; i++) {
        if (i==0) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.starting.location;
            ann.title        = startStr;
            ann.customInfo   = @{@"image":@"pos_start"};
            [annmations addObject:ann];
        }
        if (i==plan.steps.count-1) {
            DDAnnotation*ann = [[DDAnnotation alloc] init];
            ann.coordinate   = plan.terminal.location;
            ann.title        = endStr;
            ann.customInfo   = @{@"image":@"pos_end"};
=======

    [mapView setRegion:region];
    [mapView regionThatFits:region];
    [self.dataTableView reloadData];

}
-(void)setCarAnn{
    BMKDrivingRouteLine* plan =self.info[@"plan"];
    int planPointCounts = 0;
    for (int i=0; i<plan.steps.count; i++) {
        if (i==0) {
            DDAnnotation*ann=[[DDAnnotation alloc] init];
            ann.coordinate=plan.starting.location;
            ann.title=startStr;
            ann.customInfo=@{@"image":@"pos_start"};
            [annmations addObject:ann];
        }
        if (i==plan.steps.count-1) {
            DDAnnotation*ann=[[DDAnnotation alloc] init];
            ann.coordinate=plan.terminal.location;
            ann.title=endStr;
            ann.customInfo=@{@"image":@"pos_end"};
>>>>>>> master
            [annmations addObject:ann];
        }
        
        BMKDrivingStep* transitStep = [plan.steps objectAtIndex:i];
        [planArr addObject:[MapCommUtility removeFormatWithStr:transitStep.instruction]];
        
<<<<<<< HEAD
        DDAnnotation*ann            =[[DDAnnotation alloc] init];
        ann.title=[MapCommUtility removeFormatWithStr:transitStep.instruction];
        ann.coordinate              = transitStep.entrace.location;;
        ann.customInfo              =@{@"image":@"pos_car_small"};
        [annmations addObject:ann];
        planPointCounts             += transitStep.pointsCount;
=======
        DDAnnotation*ann=[[DDAnnotation alloc] init];
        ann.title=[MapCommUtility removeFormatWithStr:transitStep.instruction];
        ann.coordinate=transitStep.entrace.location;;
        ann.customInfo=@{@"image":@"pos_car_small"};
        [annmations addObject:ann];
        planPointCounts += transitStep.pointsCount;
>>>>>>> master
        
    }
    BMKMapPoint  temppoints[planPointCounts];
    int i = 0;
    for (int j = 0; j < plan.steps.count; j++) {
        BMKDrivingStep* transitStep = [plan.steps objectAtIndex:j];
        int k=0;
        for(k=0;k<transitStep.pointsCount;k++) {
            temppoints[i].x = transitStep.points[k].x;
            temppoints[i].y = transitStep.points[k].y;
            i++;
        }
        
    }
<<<<<<< HEAD
    
    BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
    [mapView addOverlay:polyLine];
    [mapView addAnnotations:annmations];
    BMKCoordinateRegion region;
    region = [MapCommUtility regionForCarAnnotations:annmations];
    [mapView setRegion:region];
    [mapView regionThatFits:region];
    [dataTableView reloadData];
    
    
=======
    BMKPolyline* polyLine = [BMKPolyline polylineWithPoints:temppoints count:planPointCounts];
    [mapView addOverlay:polyLine];
    
    [mapView addAnnotations:annmations];
    BMKCoordinateRegion region;
//   region = [MapCommUtility regionForAnnotations:mapView.annotations];
    region = [MapCommUtility regionForCarAnnotations:annmations];

    [mapView setRegion:region];
    [mapView regionThatFits:region];
    [self.dataTableView reloadData];
    

>>>>>>> master
    
    
}
#pragma mark-
#pragma mapDelegate

<<<<<<< HEAD
- (BMKOverlayView*)mapView:(BMKMapView *)map viewForOverlay:(id<BMKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.fillColor        = [[UIColor cyanColor] colorWithAlphaComponent:1];
        polylineView.strokeColor      = [[UIColor blueColor] colorWithAlphaComponent:1.0f];
        polylineView.lineWidth        = 3.0;
=======
- (BMKOverlayView*)mapView:(BMKMapView *)map viewForOverlay:(id<BMKOverlay>)overlay
{
    if ([overlay isKindOfClass:[BMKPolyline class]]) {
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:1];
        polylineView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:1.0f];
        polylineView.lineWidth = 3.0;
>>>>>>> master
        return polylineView;
    }
    return nil;
}
<<<<<<< HEAD
- (BMKAnnotationView *)mapView:(BMKMapView *)mV viewForAnnotation:(id <BMKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[BMKUserLocation class]]) {
=======
- (BMKAnnotationView *)mapView:(BMKMapView *)mV viewForAnnotation:(id <BMKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[BMKUserLocation class]]) {
        
>>>>>>> master
        return nil;
    }
    
    BMKAnnotationView *annotationView = (BMKAnnotationView *)[mV dequeueReusableAnnotationViewWithIdentifier:@"BMKAnnotationView"];
<<<<<<< HEAD
    if (!annotationView) {
=======
    if (!annotationView){
>>>>>>> master
        
        annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"BMKAnnotationView"];
    }
    
<<<<<<< HEAD
    DDAnnotation * ann            = (DDAnnotation *) annotation;
    annotationView.image          = [UIImage imageNamed:ann.customInfo[@"image"]];
    annotationView.canShowCallout = YES;
=======
    DDAnnotation * ann = (DDAnnotation *) annotation;
    annotationView.image = [UIImage imageNamed:ann.customInfo[@"image"]];
    annotationView.canShowCallout =YES;
    
>>>>>>> master
    
    return annotationView;
}



#pragma UITableViewDelegate
<<<<<<< HEAD

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  planArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(nil==cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1   reuseIdentifier:CellWithIdentifier];
    }
    cell.textLabel.text          = planArr[(int)indexPath.row];
    cell.textLabel.font          = [UIFont systemFontOfSize:12];
    cell.textLabel.textColor     = titleLableColor;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 2;
    cell.selectionStyle          = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row+1<annmations.count) {
        [mapView selectAnnotation:[annmations objectAtIndex:indexPath.row+1] animated:YES];
        BMKCoordinateRegion region;
        NSArray *curAnnArr= @[[annmations objectAtIndex:indexPath.row+1]];
        region = [MapCommUtility regionForAnnotations:curAnnArr];
        [mapView setRegion:region];
        [mapView regionThatFits:region];
=======
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  planArr.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if(nil==cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1   reuseIdentifier:CellWithIdentifier];
    }

    cell.textLabel.text=planArr[(int)indexPath.row];
    [cell.textLabel setFont:[UIFont systemFontOfSize:12]];
    [cell.textLabel setTextColor:titleLableColor];
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines=2;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row+1<annmations.count) {
        [mapView selectAnnotation:[annmations objectAtIndex:indexPath.row+1] animated:YES];
        BMKCoordinateRegion region;
        NSArray*curAnnArr=@[[annmations objectAtIndex:indexPath.row+1]];
        region = [MapCommUtility regionForAnnotations:curAnnArr];
        [mapView setRegion:region];
        [mapView regionThatFits:region];
    
>>>>>>> master
    }
}

#pragma mark initView

<<<<<<< HEAD
-(void)hideNotifiView {
=======

-(void)hideNotifiView{
>>>>>>> master
    if (notifiView.height>0) {
        [UIView animateWithDuration:0.3f animations:^{
            [notifiView setHeight:0];
        }];
    }
}

- (void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    
    CGPoint translation = [recognizer translationInView:self.view];
    if (botomView.center.y+translation.y<=botomViewDefaultCenter.y
<<<<<<< HEAD
        &&botomView.center.y+translation.y>=botomViewDefaultCenter.y-topViewMaxMove) {
=======
         &&botomView.center.y+translation.y>=botomViewDefaultCenter.y-topViewMaxMove) {
>>>>>>> master
        botomView.centerY+=translation.y;
        
    }
    if (botomViewDefaultCenter.y-botomView.center.y>topViewMaxMove/2){
<<<<<<< HEAD
        downOrUpImageView.image=[UIImage imageNamed:@"ic_nav_down"];
    }else{
        downOrUpImageView.image=[UIImage imageNamed:@"ic_nav_top"];
=======
        [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_down"]];
    }else{
        [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_top"]];
>>>>>>> master
    }
    
    if (recognizer.state==UIGestureRecognizerStateBegan) {
        beganGestureStatus=botomView.center;
    }
    
    if (recognizer.state== UIGestureRecognizerStateEnded) {
        if (beganGestureStatus.y+20>=botomViewDefaultCenter.y) {
            [self showBotomView];
            
<<<<<<< HEAD
        }else {
            [self hideBotomView];
        }
    }
    
=======
        }else{
            [self hideBotomView];
        }
        
    }
 
>>>>>>> master
    [recognizer setTranslation:CGPointZero inView:self.navigationController.view];
}
- (void) handleTap:(UITapGestureRecognizer*) recognizer{
    if (botomViewDefaultCenter.y-botomView.center.y<topViewMaxMove/2) {
        [self showBotomView];
    }else{
        [self hideBotomView];
    }
}

<<<<<<< HEAD
- (void)showBotomView {
    
    [self topViewRemoveGesture];
    [self topViewAddGesture];
    downOrUpImageView.image = [UIImage imageNamed:@"ic_nav_down"];
    [UIView animateWithDuration:0.3f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        botomView.center = CGPointMake(botomViewDefaultCenter.x, botomViewDefaultCenter.y-topViewMaxMove);
    } completion:^(BOOL finished) {
        
        if (notifiView.tag==900) {
            [UIView animateWithDuration:0.3f animations:^{
                notifiView.tag    = 1000;
                notifiView.height = 30;
=======
-(void)showBotomView{
     [self topViewRemoveGesture];
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        botomView.centerY= botomViewDefaultCenter.y-topViewMaxMove;
    } completion:^(BOOL finished) {
        [self topViewAddGesture];
        [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_down"]];
        
        if (finished&&notifiView.tag==900) {
            [UIView animateWithDuration:0.3f animations:^{
                notifiView.tag=1000;
                [notifiView setHeight:30];
>>>>>>> master
                [self performSelector:@selector(hideNotifiView) withObject:nil afterDelay:2];
                
            }];
        }

    }];
<<<<<<< HEAD
    
}

- (void)hideBotomView {
    [self topViewRemoveGesture];
    [UIView animateWithDuration:0.3f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        botomView.center = botomViewDefaultCenter;
    } completion:^(BOOL finished) {
        [self topViewAddGesture];
        downOrUpImageView.image = [UIImage imageNamed:@"ic_nav_top"];
    }];
}

- (void)initTableView {
    
    botomView=[[UIView alloc] initWithFrame:CGRectMake(0, botomGestureViewDefaultCenterY, screenWidth, 240)];
    
    botomView.backgroundColor = [UIColor clearColor];
    botomView.tag             = botomViewDownTag ;
    botomView.alpha           = 0.9f;
    botomViewDefaultCenter    = botomView.center;
    
    botomGestureView          = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 70)];
    UILabel *titleLable       = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, screenWidth-20, 20)];
    titleLable.text           = self.info[@"title"];
    titleLable.font           = [UIFont systemFontOfSize:14];
    titleLable.textColor      = titleLableColor;
    UILabel *subTitleLable    = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, screenWidth-20, 20)];
    subTitleLable.text        = self.info[@"subTitle"];
    subTitleLable.font        = [UIFont systemFontOfSize:12];
    subTitleLable.textColor   = subTitleLableColor;
    
    
    botomGestureView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [botomGestureView addSubview:titleLable];
    [botomGestureView addSubview:subTitleLable];
    
    [self topViewAddGesture];
    
    downOrUpImageView         = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2, 20, 20)];
    downOrUpImageView.image   = [UIImage imageNamed:@"ic_nav_top"];
    downOrUpImageView.centerX = botomGestureView.width/2;
    [botomGestureView addSubview:downOrUpImageView];
    
    self->dataTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, screenWidth, 170)];
    self->dataTableView.delegate       = self;
    self->dataTableView.dataSource     = self;
    self->dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [botomView addSubview:botomGestureView];
    [botomView addSubview:self->dataTableView];
    [self.view addSubview:botomView];
    
    notifiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0)];
    notifiView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    notifiView.clipsToBounds   = YES;
    notifiView.tag             = 900;
    UILabel *notifiLable       = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, screenWidth, 20)];
    notifiLable.font           = [UIFont systemFontOfSize:14];
    notifiLable.textColor      = [UIColor whiteColor];
    notifiLable.textAlignment  = NSTextAlignmentCenter;
    notifiLable.text           = @"点击具体步骤可以定位到地图上哦";
    
    [notifiView addSubview:notifiLable];
    [self->dataTableView addSubview:notifiView];
    
}
- (void)topViewAddGesture {
    
=======

   

}
-(void)hideBotomView{
     [self topViewRemoveGesture];
    
    
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        botomView.centerY= botomViewDefaultCenter.y;
    } completion:^(BOOL finished) {
        [self topViewAddGesture];
        [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_down"]];
        
        if (finished&&notifiView.tag==900) {
            [UIView animateWithDuration:0.3f animations:^{
                [self topViewAddGesture];
                [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_top"]];
                
            }];
        }
        
    }];
}
-(void)initTableView
{
    botomView=[[UIView alloc] initWithFrame:CGRectMake(0, botomGestureViewDefaultCenterY, screenWidth, 240)];
    botomView.backgroundColor=[UIColor clearColor];
    botomView.tag=botomViewDownTag ;
    [botomView setAlpha:0.9f];
    botomViewDefaultCenter=botomView.center;
    
    botomGestureView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 70)];
    UILabel*titleLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 20, screenWidth-20, 20)];
    titleLable.text=self.info[@"title"];
    [titleLable setFont:[UIFont systemFontOfSize:14]];
    [titleLable setTextColor:titleLableColor];
    UILabel*subTitleLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 40, screenWidth-20, 20)];
    subTitleLable.text=self.info[@"subTitle"];
    [subTitleLable setFont:[UIFont systemFontOfSize:12]];
    [subTitleLable setTextColor:subTitleLableColor];
    
    
    botomGestureView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [botomGestureView addSubview:titleLable];
    [botomGestureView addSubview:subTitleLable];
    [self topViewAddGesture];
    showMoreImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 2, 20, 20)];
    [showMoreImage setImage:[UIImage imageNamed:@"ic_nav_top"]];
    [showMoreImage setCenterX:botomGestureView.width/2];
    [botomGestureView addSubview:showMoreImage];
    
       self.dataTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 70, screenWidth, 170)];
    [self.dataTableView setDelegate:self];
    [self.dataTableView setDataSource:self];
    self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [botomView addSubview:botomGestureView];
    [botomView addSubview:self.dataTableView];
    [self.view addSubview:botomView];
    notifiView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0)];
    notifiView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    notifiView.clipsToBounds=YES;
    notifiView.tag=900;
    UILabel*notifiLable=[[UILabel alloc] initWithFrame:CGRectMake(0, 5, screenWidth, 20)];
    [notifiLable setFont:[UIFont systemFontOfSize:14]];
    notifiLable.textColor=[UIColor whiteColor];
    notifiLable.textAlignment=NSTextAlignmentCenter;
    notifiLable.text=@"点击具体步骤可以定位到地图上哦";
    [notifiView addSubview:notifiLable];
    [self.dataTableView addSubview:notifiView];

}
-(void)topViewAddGesture{
>>>>>>> master
    [self topViewRemoveGesture];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(handlePan:)];
<<<<<<< HEAD
    UITapGestureRecognizer*tapGestureRecognizer  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    
    [botomGestureView addGestureRecognizer:tapGestureRecognizer];
    [botomGestureView addGestureRecognizer:panGestureRecognizer];
}
- (void)topViewRemoveGesture {
    for(UIGestureRecognizer *curGes in botomGestureView.gestureRecognizers) {
        [botomGestureView removeGestureRecognizer:curGes];
    }
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    mapView.delegate = nil;
    mapView          = nil;
}
-(void)dealloc{
    MSLog(@"showLineView dealloc");
    mapView.delegate = nil;
    mapView          = nil;
=======
    UITapGestureRecognizer*tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [botomGestureView addGestureRecognizer:tapGestureRecognizer];
    [botomGestureView addGestureRecognizer:panGestureRecognizer];
}
-(void)topViewRemoveGesture{
    for(UIGestureRecognizer *curGes in botomGestureView.gestureRecognizers){
        [botomGestureView removeGestureRecognizer:curGes];
    }
}
-(void)back{

    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    mapView.delegate=nil;
    mapView=nil;
}
-(void)dealloc{
    MSLog(@"showLineView dealloc");
    mapView.delegate=nil;
    mapView=nil;
>>>>>>> master
}
@end
