//
//  MapViewPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-20.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "MapViewPage.h"
#import "POIAnnotation.h"
#import "CommonUtility.h"
#import "GameUtils.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"
@interface MapViewPage ()

@end

@implementation MapViewPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)clearMapView{
    self.mapView.showsUserLocation=NO;
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView removeOverlays:self.mapView.overlays];
    self.mapView.delegate=nil;
}

-(void)clearSearch{
    self.search.delegate=nil;
}

-(void)retureAction{
    [self clearMapView];
    [self clearSearch];
    [self.mapView.userLocation removeObserver:self forKeyPath:@"coordinate"];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma Mark - MAMapViewDelegate

-(void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    id<MAAnnotation> annotation=view.annotation;
    if([annotation isKindOfClass:[POIAnnotation class]]){
        POIAnnotation *poiAnnotation=(POIAnnotation *)annotation;
        self.poi=poiAnnotation.poi;
    }
}


-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if([annotation isKindOfClass:[POIAnnotation class]]){
        static NSString *poiIdentifier=@"poiIdentifier";
        MAPinAnnotationView *poiAnnotationView=(MAPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:poiIdentifier];
        if(poiAnnotationView==nil){
            poiAnnotationView=[[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:poiIdentifier];
        }
        poiAnnotationView.canShowCallout=YES;
        poiAnnotationView.rightCalloutAccessoryView=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return poiAnnotationView;
    }
    return nil;
}
#pragma Mark - AMapSearchDelegate
-(void)search:(id)searchRequest error:(NSString *)errInfo{
    NSLog(@"%s: searchRequest = %@, errInfo= %@", __func__, [searchRequest class], errInfo);
}

-(void)onPlaceSearchDone:(AMapPlaceSearchRequest *)request response:(AMapPlaceSearchResponse *)response{
    if(request.searchType!=self.searchType)
        return;
    if(response.pois.count==0)
        return;
    if(self.AnnotationNote.count==0)
    {
        for (AMapPOI *poi in response.pois)
        {
            [self.AnnotationNote addObject:poi.name];
        }
        [self.Table reloadData];
    }
    
    
//    NSMutableArray *poiAnnotations=[NSMutableArray arrayWithCapacity:response.pois.count];
//    [response.pois enumerateObjectsUsingBlock:^(AMapPOI *obj,NSUInteger idx,BOOL *stop){
//        [poiAnnotations addObject:[[POIAnnotation alloc]initWithPOI:obj]];
//    }];
//    [self.mapView addAnnotations:poiAnnotations];
//    [self.mapView showAnnotations:poiAnnotations animated:YES];
}

#pragma Mark - Initialization
-(void)initMapView{
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 44, 320, 280)];
    self.mapView.delegate=self;
    [self.view addSubview:self.mapView];
    self.mapView.visibleMapRect=MAMapRectMake(220880104, 101476980, 272496, 466656);
    
}


-(void)initSearch{
    self.search = [[AMapSearchAPI alloc] initWithSearchKey:[MAMapServices sharedServices].apiKey Delegate:nil];
    self.search.delegate=self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initObservers];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.mapView.showsUserLocation=YES;
    self.mapView.userTrackingMode=1;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initMapView];
    [self initSearch];
    self.AnnotationNote=[NSMutableArray array];
    self.searchType=AMapSearchType_PlaceAround;
    [self.mapView setZoomLevel:self.mapView.maxZoomLevel-5 animated:YES];
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_back"] selectedImage:[UIImage imageNamed:@"navigationItem_back_hl"]
                               target:self
                               action:@selector(leftTapped:)];
    self.NavItem.leftBarButtonItem=settingsBtn;
    MoLabel *label=[MoLabel LabelWithTitle:@"地图定位"];
    self.NavItem.titleView=label;
    [self.CustomNav setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view from its nib.
}


#pragma mark tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.AnnotationNote count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                 reuseIdentifier: CellIdentifier] ;
    //NSLog(@"%d__%@",indexPath.row,[self.AnnotationNote objectAtIndex:indexPath.row]);
    cell.textLabel.text=[self.AnnotationNote objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps=[calendar components:(NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:date];
    NSString *Time=[NSString stringWithFormat:@"%ld:%ld",(long)[comps hour],(long)[comps minute]];
    NSString *Note=[NSString stringWithFormat:@"%@ %@",Time,[self.AnnotationNote objectAtIndex:indexPath.row]];
    [[GameUtils getCurrentUserInfo].CheckInPlace addObject:Note];
    [self retureAction];
}

- (void)initObservers
{
    /* Add observer for showsUserLocation. */
    [self.mapView.userLocation addObserver:self forKeyPath:@"coordinate" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - NSKeyValueObservering

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"coordinate"])
    {
       [self searchPoiByCenterCoordinate];
    }
}


/* 根据中心点坐标来搜周边的POI. */
- (void)searchPoiByCenterCoordinate
{
    AMapPlaceSearchRequest *request = [[AMapPlaceSearchRequest alloc] init];
    
    request.searchType          = AMapSearchType_PlaceAround;
    request.location            = [AMapGeoPoint locationWithLatitude:self.mapView.userLocation.coordinate.latitude longitude:self.mapView.userLocation.coordinate.longitude];
    //request.keywords            = @"餐饮";
    /* 按照距离排序. */
    request.sortrule            = 1;
    request.requireExtension    = YES;
    
    
    [self.search AMapPlaceSearch:request];
}

-(void)leftTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
