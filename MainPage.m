//
//  MainPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "MainPage.h"
#import "IIViewDeckController.h"
#import "CenterPage.h"
#import "AppPage.h"
#import "SearchPage.h"
#import "NotePage.h"
#import "LeftPage.h"

@interface MainPage ()

@end

@implementation MainPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.StepItem.layer setMasksToBounds:YES];
    self.StepItem.layer.cornerRadius=5.0;
    self.PhoneText.layer.cornerRadius=8.0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)NextStep:(id)sender {
    [self AddAnimation];
    
    [self ShowNext];
    
}

-(void)ShowNext{
    self.Window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    LeftPage *LeftView=[[LeftPage alloc]initWithNibName:@"LeftPage" bundle:nil];
    CenterPage *CenterView=[[CenterPage alloc]initWithNibName:@"CenterPage" bundle:nil];
    AppPage *AppView=[[AppPage alloc]initWithNibName:@"AppPage" bundle:nil];
    SearchPage *SearchView=[[SearchPage alloc]initWithNibName:@"SearchPage" bundle:nil];
    NotePage *NoteView=[[NotePage alloc]initWithNibName:@"NotePage" bundle:nil];
    self.TabBarCon=[[UITabBarController alloc]init];
    self.TabBarCon.viewControllers=@[CenterView,AppView,SearchView,NoteView];
    UINavigationController  *ViewNav = [[UINavigationController alloc] initWithRootViewController:self.TabBarCon];
    [ViewNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    [ViewNav setNavigationBarHidden:YES animated:NO];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    IIViewDeckController *IIView=[[IIViewDeckController alloc]initWithCenterViewController:ViewNav leftViewController:LeftView];
    IIView.leftSize=60;
    self.Window.rootViewController=IIView;
    [self.view removeFromSuperview];
    self.view=nil;
    [self.Window makeKeyAndVisible];
}

-(void)AddAnimation{
    CABasicAnimation *shake=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue=[NSNumber numberWithFloat:0];
    shake.toValue=[NSNumber numberWithFloat:2*M_PI];
    shake.duration=0.8;
    shake.autoreverses=NO;
    shake.repeatCount=5;
    [self.Snep.layer addAnimation:shake forKey:@"shakeAnimation"];
    self.Snep.alpha=1.0;
    [UIView animateWithDuration:10.0 delay:0.0 options:UIViewAnimationCurveEaseIn|UIViewAnimationOptionAllowUserInteraction animations:^{
        self.Snep.alpha=0.0;
    }completion:nil];
}



- (IBAction)KeyBoardMiss:(id)sender {
    [self.PhoneText resignFirstResponder];
}
@end
