//
//  NotePage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "NotePage.h"

@interface NotePage ()

@end

@implementation NotePage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"通讯录" image:[UIImage imageNamed:@"tab_bar_contact_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_contact_highlight"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
