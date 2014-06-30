//
//  SCanPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-30.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
@interface SCanPage : UIViewController<ZBarReaderDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *CustomNav;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;
@end
