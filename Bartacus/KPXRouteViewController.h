//
//  KPXRouteViewController.h
//  Bartacus
//
//  Created by Ken Ceglia on 5/21/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPXRouteViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableViewCell *fromStationCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *toStationCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *fairAmount;

@end
