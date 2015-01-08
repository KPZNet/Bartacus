//
//  KPXStationDepartures.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/10/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMXMLDocument;

@interface KPXStationDepartures : NSObject

@property SMXMLDocument* bartDoc;
@property NSMutableArray* stationDepartures;

-(BOOL)GetDepartures :(NSString*)stationAbbrev;

@end
