//
//  AppPage.h
//  MobileCheckIn
//
//  Created by OPSOFT on 14-6-17.
//  Copyright (c) 2014年 OPSOFT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppPage : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;
@end
