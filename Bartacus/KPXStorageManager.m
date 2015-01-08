//
//  KPXStorageManager.m
//  Bartacus
//
//  Created by Kenneth Ceglia on 6/7/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStorageManager.h"
#import "KPXStation.h"

@implementation KPXStorageManager


-(void)StoreRoute : (KPXStation*)fromStation ToStation : (KPXStation*)toStation
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:fromStation forKey:fromStation.abbrev];
    [defaults synchronize];
    NSLog(@"Station: %@", fromStation);
    
    KPXStation* inStat;
    
    inStat = [defaults objectForKey:fromStation.abbrev];
    
    NSLog(@"InStat: %@", inStat);
    
    
//    NSMutableArray* enterprisePersistantList = [NSMutableArray new];
//    for(MXEnterprise *ent in _enterpriseList)
//    {
//        [enterprisePersistantList addObject:[ent description]];
//    }
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:enterprisePersistantList forKey:@"enterpriseList"];
//    
//    [defaults synchronize];
}

-(void)LoadFleetFromLocalRepository
{
    
//    [_enterpriseList removeAllObjects];
//    
//    // Get the stored data before the view loads
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSArray *savedEnterprises = [defaults objectForKey:@"enterpriseList"];
//    
//    for(NSString *enterpriseDescription in savedEnterprises)
//    {
//        MXEnterprise* entDetails = [[MXEnterprise alloc] initFromDescription:enterpriseDescription];
//        [_enterpriseList addObject:entDetails];
//        
//    }
    
}


@end
