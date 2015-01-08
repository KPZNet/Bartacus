//
//  KPXStorageManager.h
//  Bartacus
//
//  Created by Kenneth Ceglia on 6/7/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KPXStation;

@interface KPXStorageManager : NSObject

-(void)StoreRoute : (KPXStation*)fromStation ToStation : (KPXStation*)toStation;

@end
