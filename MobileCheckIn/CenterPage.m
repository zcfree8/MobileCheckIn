//
//  CenterPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "CenterPage.h"
#import "ILBarButtonItem.h"
@interface CenterPage ()

@end

@implementation CenterPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"tab_bar_message_normal"] selectedImage:[UIImage imageNamed:@"tab_bar_message_highlight"]];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_menu_hl"] selectedImage:nil
                               target:self
                               action:@selector(leftTapped:)];
    self.navigationItem.leftBarButtonItem = settingsBtn;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftTapped:(id)sender{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

@end
