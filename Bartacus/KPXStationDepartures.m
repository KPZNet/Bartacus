//
//  KPXStationDepartures.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/10/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStationDepartures.h"
#import "SMXMLDocument.h"
#import "KPXDestination.h"

@implementation KPXStationDepartures





-(BOOL)GetDepartures :(NSString*)stationAbbrev;
{
    BOOL returnValue = FALSE;
    NSError *error;
    
    _stationDepartures = [NSMutableArray new];
    
    NSString* bartURLString = [NSString stringWithFormat:@"http://api.bart.gov/api/etd.aspx?cmd=etd&orig=%@&key=ZUKP-YX9M-Q5DQ-8UTV", stationAbbrev];
    
    NSURL *myUrl = [NSURL URLWithString:bartURLString];
    NSData *myData = [NSData dataWithContentsOfURL:myUrl];
    _bartDoc = [SMXMLDocument documentWithData:myData error:&error];

    // check for errors
    if (error)
    {
        NSLog(@"Error while parsing the document: %@", error);
    }
    
	SMXMLElement *station = [_bartDoc childNamed:@"station"];
	
	// Look through <books> children of type <book>
	for (SMXMLElement *destination in [station childrenNamed:@"etd"])
    {
        KPXDestination* newDestination = [KPXDestination new];
        newDestination.trains = [NSMutableArray new];
        
        newDestination.destinationStation = [destination valueWithPath:@"destination"];
        newDestination.abbrev = [destination valueWithPath:@"abbreviation"];
        
        for (SMXMLElement *arrivingTrain in [destination childrenNamed:@"estimate"])
        {
            KPXDepartingTrain* train = [KPXDepartingTrain new];
            
            train.minutes = [arrivingTrain valueWithPath:@"minutes"];
            train.platform = [arrivingTrain valueWithPath:@"platform"];
            train.direction = [arrivingTrain valueWithPath:@"direction"];
            train.length = [arrivingTrain valueWithPath:@"length"];
            train.color = [arrivingTrain valueWithPath:@"color"];
            train.hexcolor = [arrivingTrain valueWithPath:@"hexcolor"];
            train.bikeFlag = [arrivingTrain valueWithPath:@"bikeflag"];
            
            [newDestination.trains addObject:train];
        }
        [_stationDepartures addObject:newDestination];
	}
    return returnValue;
}

@end
