//
//  MoLabel.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-21.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "MoLabel.h"

@implementation MoLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)Title{
    self= [[MoLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self setTextColor:[UIColor whiteColor]];
    [self setText:Title];
    self.textAlignment=NSTextAlignmentCenter;
    self.font = [UIFont boldSystemFontOfSize:20];
    return self;
}

+(MoLabel *)LabelWithTitle:(NSString *)Title{
    return [[MoLabel alloc]initWithTitle:Title];
}


@end
