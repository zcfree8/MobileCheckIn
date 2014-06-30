//
//  SCanPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-30.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "SCanPage.h"
#import "ILBarButtonItem.h"
#import "MoLabel.h"
@interface SCanPage ()

@end

@implementation SCanPage

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
    
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_back"] selectedImage:[UIImage imageNamed:@"navigationItem_back_hl"]
                               target:self
                               action:@selector(leftTapped:)];
    self.NavItem.leftBarButtonItem=settingsBtn;
    MoLabel *label=[MoLabel LabelWithTitle:@"二维码扫描"];
    self.NavItem.titleView=label;
    [self.CustomNav setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    
    ZBarReaderViewController *reader=[ZBarReaderViewController new];
    reader.readerDelegate=self;
    reader.showsZBarControls=NO;
    
    [self setOverlayPickerView:reader];
    
    reader.supportedOrientationsMask=ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner=reader.scanner;
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    [self presentViewController:reader animated:YES completion:nil];
    // Do any additional setup after loading the view from its nib.
}


//填充界面
-(void)setOverlayPickerView:(ZBarReaderViewController *)reader{
    for(UIView *temp in [reader.view subviews])
    {
        for(UIButton *btn in [temp subviews]){
            if([btn isKindOfClass:[UIButton class]]){
                [btn removeFromSuperview];
            }
        }
        for(UIToolbar *toolbar in [temp subviews]){
            if([toolbar isKindOfClass:[UIToolbar class]]){
                [toolbar setHidden:YES];
                [toolbar removeFromSuperview];
            }
        }
    }
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    id<NSFastEnumeration> results=
    [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol *symbol=nil;
    for(symbol in results)
        break;
    
    NSLog(@"%@",symbol.data);
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 300)];
    label.textColor=[UIColor blackColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.lineBreakMode=NSLineBreakByWordWrapping;
    label.numberOfLines=0;
    label.text=symbol.data;
    [self.view addSubview:label];
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
