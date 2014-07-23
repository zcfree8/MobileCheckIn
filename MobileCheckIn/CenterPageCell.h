//
//  CenterPageCell.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-7-22.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "TableViewCell.h"

@interface CenterPageCell : TableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *Head;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
