//
//  KPXDepartureStationCell.h
//  Bartacus
//
//  Created by Kenneth Ceglia on 5/17/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPXDepartureStationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stationName;

@property (weak, nonatomic) IBOutlet UITextField *trainOne;
@property (weak, nonatomic) IBOutlet UITextField *trainTwo;
@property (weak, nonatomic) IBOutlet UITextField *trainThree;
@property (weak, nonatomic) IBOutlet UIView *trainOneLine;
@property (weak, nonatomic) IBOutlet UIView *trainTwoLine;
@property (weak, nonatomic) IBOutlet UIView *trainThreeLine;

@property (weak, nonatomic) IBOutlet UIImageView *trainBikeImageNo;
@property (weak, nonatomic) IBOutlet UIImageView *trainBikeImageYes;

@end
