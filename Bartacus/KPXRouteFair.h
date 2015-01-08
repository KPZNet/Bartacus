//
//  KPXRouteFair.h
//  Bartacus
//
//  Created by Kenneth Ceglia on 5/24/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMXMLDocument;

@interface KPXRouteFair : NSObject

@property SMXMLDocument* bartDoc;
@property NSString* routeFair;
@property NSString* routeFairClipperDiscount;

-(BOOL)GetRouteFair :(NSString*)fromStation : (NSString*)toStation;

@end
