//
//  SubViewPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-29.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "SubViewPage.h"
#import "Model.h"
@interface SubViewPage ()

@end

@implementation SubViewPage

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
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    Model *Model1=[[Model alloc]initImageName:@"message_img_lxr_duihua" AndTitleName:@"发微博"];
    Model *Model2=[[Model alloc]initImageName:@"message_img_lxr_collect" AndTitleName:@"拍照"];
    NSArray *ModelArray=[NSArray arrayWithObjects:Model1,Model2, nil];
    int total=ModelArray.count;int COLUMN=4;int ROWHEIHT=50;
    for (int i=0; i<total; i++) {
        Model *CurModel=[ModelArray objectAtIndex:i];
        int row = i / COLUMN;
        int column = i % COLUMN;
       
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(70+60*column, ROWHEIHT*row, 80, ROWHEIHT)];
        view.backgroundColor = [UIColor clearColor];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15, 15, 30, 30);
        btn.tag = i;
        [btn addTarget:self.CheckIn
                action:@selector(subCateBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
        
        [btn setBackgroundImage:[UIImage imageNamed:CurModel.ImageName]
                       forState:UIControlStateNormal];
        
        [view addSubview:btn];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 60, 14)];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:12.0f];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.text = CurModel.TitleName;
        [view addSubview:lbl];
        
        [self.view addSubview:view];
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height = ROWHEIHT  + 19;
    self.view.frame = viewFrame;
    // Do any additional setup after loading the view from its nib.
}

-(void)subCateBtnAction:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
