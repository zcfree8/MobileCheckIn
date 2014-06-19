//
//  CheckInPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckInPage : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *CheckIn;
- (IBAction)CheckInClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Record;
@property (weak, nonatomic) IBOutlet UITableView *CheckInView;

@end
