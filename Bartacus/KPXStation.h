//
//  KPXStation.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/9/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KPXStation : NSObject

@property (copy) NSString* name;
@property (copy) NSString* abbrev;
@property (copy) NSString* latitude;
@property (copy) NSString* longitude;
@property (copy) NSString* address;
@property (copy) NSString* city;
@property (copy) NSString* county;
@property (copy) NSString* state;
@property (copy) NSString* zip;

//Added a comment
- (NSString *) description;



@end
