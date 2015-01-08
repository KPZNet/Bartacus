//
//  KPXStation.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/9/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStation.h"

@implementation KPXStation

- (NSString *) description
{
    NSString* ds = [NSString stringWithFormat: @"name:%@\nabbrev:%@", _name, _abbrev];
//    name
//    abbrev
//    latitude
//    longitude
//    address
//    city
//    county
//    state
//    zip
    
    return ds;
}

@end
