//
//  CollectionCell.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-18.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *arrayOfViews=[[NSBundle mainBundle]loadNibNamed:@"CollectionCell" owner:self options:nil];
        if(arrayOfViews.count<1){
            return nil;
        }
        if(![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]){
            return nil;
        }
        self=[arrayOfViews objectAtIndex:0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
