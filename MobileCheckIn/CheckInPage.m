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
@interface CheckInPage ()<MJRefreshBaseViewDelegate>{
    MJRefreshHeaderView *_header;
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
    [self.CheckInView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"signin_bg"]];
    UILabel *Month=[[UILabel alloc]initWithFrame:CGRectMake(35, 23, 30, 20)];
    UILabel *Day=[[UILabel alloc]initWithFrame:CGRectMake(20, 28, 80, 80)];
    
    [Month setTextColor:[UIColor whiteColor]];
    [Day setTextColor:[UIColor blackColor]];
    Month.font=[UIFont fontWithName:nil size:15];
    Day.font=[UIFont fontWithName:nil size:45];
    NSDate *date=[NSDate date];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps=[calendar components:(NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:date];
    Month.text=[NSString stringWithFormat:@"%ld月",(long)[comps month]];
    Day.text=[NSString stringWithFormat:@"%ld",(long)[comps day]];
    [self.view addSubview:Month];
    [self.view addSubview:Day];
    _header=[[MJRefreshHeaderView alloc]init];
    _header.delegate=self;
    _header.scrollView=self.CheckInView;
    [_header endRefreshing];
    self.CheckInView.backgroundColor=[UIColor clearColor];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"移动签到";
    self.navigationItem.titleView=label;
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
    return 1;
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
        cell.backgroundColor=[UIColor clearColor];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark 代理方法-进入刷新状态就会调用
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //刷新数据源
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self.CheckInView selector:@selector(reloadData) userInfo:nil repeats:NO];
}

- (IBAction)CheckInClick:(id)sender {
}
@end
