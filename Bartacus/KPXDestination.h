//
//  KPXDestination.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/11/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KPXDestination : NSObject

@property (copy) NSString* destinationStation;
@property (copy) NSString* abbrev;
@property NSMutableArray* trains;

@end

@interface KPXDepartingTrain : NSObject

@property (copy) NSString* minutes;
@property (copy) NSString* platform;
@property (copy) NSString* direction;
@property (copy) NSString* length;
@property (copy) NSString* color;
@property (copy) NSString* hexcolor;
@property (copy) NSString* bikeFlag;


@end
