//
//  Model.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-28.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic,strong)NSString *ImageName;
@property(nonatomic,strong)NSString *TitleName;
-(id)initImageName:(NSString *)ImageName AndTitleName:(NSString *)TitleName;
@end
