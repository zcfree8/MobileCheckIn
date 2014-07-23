//
//  MapViewPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-20.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>

@interface MapViewPage : UIViewController<MAMapViewDelegate,AMapSearchDelegate>

@property (weak, nonatomic) IBOutlet UITableView *Table;

@property(nonatomic,strong)MAMapView *mapView;
@property(nonatomic,strong)AMapSearchAPI *search;

@property(nonatomic,readwrite,strong)AMapPOI *poi;
@property(nonatomic)AMapSearchType searchType;
-(void)retureAction;

@property(nonatomic,strong)NSMutableArray *AnnotationNote;
@property (weak, nonatomic) IBOutlet UINavigationBar *CustomNav;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;


@end

@interface Config : NSObject
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *Address;
-(id)initConfigWithName:(NSString *)Name AndAddress:(NSString *)Address;

@end
