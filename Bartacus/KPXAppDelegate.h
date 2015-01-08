//
//  KPXAppDelegate.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/9/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

//  ZUKP-YX9M-Q5DQ-8UTV

#import <UIKit/UIKit.h>
#import "KPXStationList.h"

@interface KPXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property KPXStationList* stations;

@end
