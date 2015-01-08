//
//  KPXRouteFair.m
//  Bartacus
//
//  Created by Kenneth Ceglia on 5/24/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXRouteFair.h"
#import "SMXMLDocument.h"

@implementation KPXRouteFair

-(BOOL)GetRouteFair :(NSString*)fromStation : (NSString*)toStation;
{
    BOOL returnValue = FALSE;
    NSError *error;
    
    
    NSString* bartURLString = [NSString stringWithFormat:@"http://api.bart.gov/api/sched.aspx?cmd=fare&orig=%@&dest=%@&date=today&key=ZUKP-YX9M-Q5DQ-8UTV", fromStation, toStation];
    
    NSURL *myUrl = [NSURL URLWithString:bartURLString];
    NSData *myData = [NSData dataWithContentsOfURL:myUrl];
    _bartDoc = [SMXMLDocument documentWithData:myData error:&error];
    
    NSLog(@"Document:\n %@", _bartDoc);
    
    // check for errors
    if (error)
    {
        NSLog(@"Error while parsing the document: %@", error);
    }
    else
    {
        returnValue = TRUE;
    }
    _routeFair = [_bartDoc valueWithPath:@"trip.fare"];
    _routeFairClipperDiscount = [_bartDoc valueWithPath:@"trip.discount.clipper"];

    return returnValue;
}

@end
