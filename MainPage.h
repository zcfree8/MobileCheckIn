//
//  MainPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPage : UIViewController<UITabBarControllerDelegate>

@property(nonatomic,strong)UITabBarController *TabBarCon;
@property(nonatomic,strong)UIWindow *Window;
- (IBAction)NextStep:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *StepItem;
@property (weak, nonatomic) IBOutlet UIImageView *Snep;
@property (weak, nonatomic) IBOutlet UITextField *PhoneText;
- (IBAction)KeyBoardMiss:(id)sender;

@end
