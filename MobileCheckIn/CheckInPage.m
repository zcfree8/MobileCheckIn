//
//  CheckInPage.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "CheckInPage.h"
#import "TableViewCell.h"
#import "MJRefresh.h"
#import "MoLabel.h"
#import "ILBarButtonItem.h"
#import "NSString+deviceString.h"
#import "MapViewPage.h"
#import "GameUtils.h"
#import "SubViewPage.h"
@interface CheckInPage ()<MJRefreshBaseViewDelegate>{
    MJRefreshHeaderView *_header;
    SubViewPage *SubVP;
}

@end

@implementation CheckInPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.Data=[GameUtils getCurrentUserInfo].CheckInPlace;
    [self.CheckInView reloadData];
 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //适配
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    
    UILabel *Month=[[UILabel alloc]initWithFrame:CGRectMake(35, 67, 30, 20)];
    UILabel *Day=[[UILabel alloc]initWithFrame:CGRectMake(26, 88, 40, 40)];
    
    [Month setTextColor:[UIColor whiteColor]];
    [Day setTextColor:[UIColor blackColor]];
    Month.font=[UIFont fontWithName:nil size:15];
    Day.font=[UIFont fontWithName:nil size:35];
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps=[calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:date];
    Month.text=[NSString stringWithFormat:@"%ld月",(long)[comps month]];
    Day.text=[NSString stringWithFormat:@"%ld",(long)[comps day]];
    [Day setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:Month];
    [self.view addSubview:Day];
    _header=[[MJRefreshHeaderView alloc]init];
    _header.delegate=self;
    _header.scrollView=self.CheckInView;
    [_header endRefreshing];
    self.CheckInView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    self.CheckInView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.CheckIn setImage:[UIImage imageNamed:@"signin_button_hl"] forState:UIControlStateHighlighted];
    
    ILBarButtonItem *settingsBtn =
    [ILBarButtonItem barItemWithImage:[UIImage imageNamed:@"navigationItem_back"] selectedImage:[UIImage imageNamed:@"navigationItem_back_hl"]
                               target:self
                               action:@selector(leftTapped:)];
    self.NavItem.leftBarButtonItem=settingsBtn;
    MoLabel *label=[MoLabel LabelWithTitle:@"移动签到"];
    self.NavItem.titleView=label;
    [self.CustomNav setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [_header endRefreshing];
    self.Record.text=[NSString stringWithFormat:@"我的签到记录%d条",(int)self.Data.count];
    return self.Data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        static NSString *CellIdentifier=@"Cell";
        BOOL nibsRegistered = NO;
        if(!nibsRegistered){
            UINib *nib=[UINib nibWithNibName:@"TableViewCell" bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
            nibsRegistered=YES;
        }
        TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        cell.label.text=[self.Data objectAtIndex:[self Upsidedown:indexPath.row]];
        cell.label.textColor=[UIColor blueColor];
        cell.backgroundColor=[UIColor clearColor];
    
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    
}

-(NSInteger)Upsidedown:(NSInteger)indexPathRow{
    NSInteger Num=(NSInteger)[self.Data count]-indexPathRow-1;
    return Num;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.CurrentIndex=indexPath.row;
    //点击添加功能
    SubViewPage *subVc = [[SubViewPage alloc]
                                     initWithNibName:NSStringFromClass([SubViewPage class])
                                     bundle:nil];
    subVc.CheckIn=self;
    self.CheckInView.scrollEnabled = NO;
    UIFolderTableView *folderTableView = (UIFolderTableView *)tableView;
    [folderTableView openFolderAtIndexPath:indexPath WithContentView:subVc.view
                                 openBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                     // opening actions
                                 }
                                closeBlock:^(UIView *subClassView, CFTimeInterval duration, CAMediaTimingFunction *timingFunction){
                                    // closing actions
                                }
                           completionBlock:^{
                               // completed actions
                               self.CheckInView.scrollEnabled = YES;
                           }];
    
}

-(CGFloat)tableView:(UIFolderTableView *)tableView xForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark 代理方法-进入刷新状态就会调用
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //刷新数据源
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self.CheckInView selector:@selector(reloadData) userInfo:nil repeats:NO];
}

- (IBAction)CheckInClick:(id)sender {
    
    MapViewPage *mapViewPage=[[MapViewPage alloc]initWithNibName:@"MapViewPage" bundle:nil];
    [self.navigationController pushViewController:mapViewPage animated:YES];
}


-(void)subCateBtnAction:(UIButton *)btn
{
    if(btn.tag==0){
        
    }else if (btn.tag==1){
        
    }
}


-(void)leftTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
