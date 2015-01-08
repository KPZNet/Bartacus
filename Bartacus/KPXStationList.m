//
//  KPXStationList.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/10/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStationList.h"
#import "SMXMLDocument.h"
#import "KPXStation.h"

@implementation KPXStationList

- (id)initWithStations
{
    self = [super init];
    if (self)
    {
        [self GetStations];
    }
    return self;
}

-(BOOL)GetStations
{
    BOOL returnValue = FALSE;
    
    NSMutableDictionary* mutableStationDictionary = [NSMutableDictionary new];
    
    // find "BARTStations" in our bundle resources
	NSString *bartStationsXML = [[NSBundle mainBundle] pathForResource:@"BARTStations" ofType:@"xml"];
	NSData *data = [NSData dataWithContentsOfFile:bartStationsXML];
	
	// create a new SMXMLDocument with the contents of sample.xml
    NSError *error;
	SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];
    
    // check for errors
    if (error) {
        NSLog(@"Error while parsing the document: %@", error);
    }
    
	SMXMLElement *stations = [document childNamed:@"stations"];
    returnValue = TRUE;
	
	// Look through <books> children of type <book>
	for (SMXMLElement *station in [stations childrenNamed:@"station"]) {
		
        KPXStation* bartStation = [KPXStation new];

		bartStation.name        = [station valueWithPath:@"name"];
        bartStation.abbrev      = [station valueWithPath:@"abbr"];
        bartStation.longitude   =[station valueWithPath:@"gtfs_longitude"];
        bartStation.latitude    = [station valueWithPath:@"gtfs_latitude"];
        bartStation.address     = [station valueWithPath:@"address"];
        bartStation.city        = [station valueWithPath:@"city"];
        bartStation.county      = [station valueWithPath:@"county"];
        bartStation.state       = [station valueWithPath:@"state"];
        bartStation.zip         = [station valueWithPath:@"zip"];
                              
        [mutableStationDictionary setObject:bartStation forKey:bartStation.abbrev];

	}
    _stationDictionary = [[NSDictionary alloc] initWithDictionary:mutableStationDictionary];
    
    NSMutableArray* mutableStationArray =  [[_stationDictionary allValues] mutableCopy];
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    _stationArray = [[mutableStationArray sortedArrayUsingDescriptors:sortDescriptors] copy];

    return returnValue;
}

@end
