//
//  CheckInPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UIFolderTableView.h"

@interface CheckInPage : UIViewController<UITableViewDataSource,UITableViewDelegate,UIFolderTableViewDelegate>{

}

@property (weak, nonatomic) IBOutlet UIButton *CheckIn;
- (IBAction)CheckInClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Record;
@property (weak, nonatomic) IBOutlet UIFolderTableView *CheckInView;
@property(assign)NSUInteger CurrentIndex;
@property(nonatomic,strong)NSMutableArray *Data;
@property (weak, nonatomic) IBOutlet UINavigationBar *CustomNav;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;


@end
