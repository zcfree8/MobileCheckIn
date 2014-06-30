//
//  Model.m
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-28.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import "Model.h"

@implementation Model

-(void)dealloc{
    self.ImageName=nil;
    self.TitleName=nil;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Image:%@ Title:%@",self.ImageName,self.TitleName];
}

-(id)initImageName:(NSString *)ImageName AndTitleName:(NSString *)TitleName{
    if(self=[super init]){
        self.ImageName=ImageName;
        self.TitleName=TitleName;
    }
    return self;
}
@end
