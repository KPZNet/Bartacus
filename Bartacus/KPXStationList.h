//
//  KPXStationList.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/10/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPXStationList : NSObject

@property NSDictionary* stationDictionary;
@property NSArray* stationArray;


- (id)initWithStations;
-(BOOL)GetStations;

@end
