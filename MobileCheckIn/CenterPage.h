//
//  CenterPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
@interface CenterPage : UIViewController
@property (weak, nonatomic) IBOutlet UINavigationBar *CustomNav;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;
@property (weak, nonatomic) IBOutlet UITableView *MainTable;
@property(nonatomic,strong)NSMutableArray *DataArray;
@end

@interface comments : NSObject
@property(assign)NSString *ImageName;
@property(assign)NSString *title;
@property(assign)NSString *detail;
@property(assign)NSString *time;

-(id)initWithImageName:(NSString *)ImageName Andtitle:(NSString *)title Anddetail:(NSString *)detail Andtime:(NSString *)time;
@end
