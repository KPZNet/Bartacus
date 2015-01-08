//
//  KPXStationArrivalsViewController.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/11/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStationDeparturesViewController.h"
#import "KPXStationDepartures.h"
#import "KPXDestination.h"
#import "KPXDepartureStationCell.h"

@interface KPXStationDeparturesViewController ()

@property KPXStationDepartures* arrivals;

@end



@implementation KPXStationDeparturesViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _arrivals = [KPXStationDepartures new];
    [_arrivals GetDepartures:_station.abbrev];
    
    self.navigationItem.title = _station.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSInteger totalArrivals = _arrivals.stationDepartures.count;
    
    return totalArrivals;
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}
-(void)ClearRow : (KPXDepartureStationCell*)cell
{
    cell.trainOne.hidden = TRUE;
    cell.trainTwo.hidden = TRUE;
    cell.trainThree.hidden = TRUE;
    cell.trainOneLine.hidden = TRUE;
    cell.trainTwoLine.hidden = TRUE;
    cell.trainThreeLine.hidden = TRUE;
    cell.trainBikeImageNo.hidden = TRUE;
    cell.trainBikeImageYes.hidden = TRUE;
}
-(void)SetTrainCell : (KPXDepartureStationCell*)cell
{
    cell.trainOne.hidden = FALSE;
    cell.trainTwo.hidden = FALSE;
    cell.trainThree.hidden = FALSE;
    cell.trainOneLine.hidden = FALSE;
    cell.trainTwoLine.hidden = FALSE;
    cell.trainThreeLine.hidden = FALSE;

}
-(void)boldFontForLabel:(UILabel *)label{
    UIFont *currentFont = label.font;
    UIFont *newFont = [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",currentFont.fontName] size:currentFont.pointSize];
    label.font = newFont;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrainCell" forIndexPath:indexPath];
    
    // Configure the cell...
    KPXDestination* destination = [_arrivals.stationDepartures objectAtIndex:indexPath.row];
    
//    NSString* arrivalTrains = [NSMutableString stringWithFormat:@"Times "];
//    for (KPXArrivingTrain *aTrain in destination.trains)
//    {
//        NSString* trainTime = [NSString new];
//        if ([aTrain.minutes rangeOfString:@"Leaving"].location == NSNotFound)
//        {
//            trainTime = [NSString stringWithFormat:@": %@ mins", aTrain.minutes];
//        }
//        else
//        {
//            trainTime = [NSString stringWithFormat:@" %@ ", aTrain.minutes];
//        }
//        arrivalTrains = [arrivalTrains stringByAppendingString : trainTime];
//    }
//    
//    cell.textLabel.text = destination.destinationStation;
//    cell.detailTextLabel.text = arrivalTrains;
    
    
    static NSString *simpleTableIdentifier = @"DepartureStationCell";
    KPXDepartureStationCell *cell = (KPXDepartureStationCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DepartureStationCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.stationName.text = destination.destinationStation;
    [self boldFontForLabel:cell.stationName];
    
    
    NSInteger i = 0;
    [self ClearRow:cell];
    for (KPXDepartingTrain *dtrain in destination.trains)
    {
        NSString* trainString;
        if ([dtrain.minutes rangeOfString:@"Leaving"].location != NSNotFound)
        {
            if(0==i){
                trainString = [NSString stringWithFormat:@"Boarding %@ cars Platform %@", dtrain.length, dtrain.platform];
            }
            else{
                trainString = [NSString stringWithFormat:@"Boarding"];
            }
        }
        else
        {
            if(0==i){
                trainString = [NSString stringWithFormat:@"%@ mins %@ cars Platform %@", dtrain.minutes, dtrain.length, dtrain.platform];
            }
            else{
                trainString = [NSString stringWithFormat:@"%@ mins", dtrain.minutes];
            }
        }
        UIColor *color1 = [self getUIColorObjectFromHexString:dtrain.hexcolor alpha:.9];
        
        if(0==i)
        {
            cell.trainOne.hidden = FALSE;
            cell.trainOneLine.hidden = FALSE;
            cell.trainOne.text = trainString;
            cell.trainOneLine.backgroundColor = color1;
            
            if(dtrain.bikeFlag)
            {
                cell.trainBikeImageNo.hidden = TRUE;
                cell.trainBikeImageYes.hidden = FALSE;
            }
            else
            {
                cell.trainBikeImageNo.hidden = FALSE;
                cell.trainBikeImageYes.hidden = TRUE;
            }
        }
        if(1==i)
        {
            cell.trainTwo.hidden = FALSE;
            cell.trainTwoLine.hidden = FALSE;
            cell.trainTwo.text = trainString;
            cell.trainTwoLine.backgroundColor = color1;
        }
        if(2==i)
        {
            cell.trainThree.hidden = FALSE;
            cell.trainThreeLine.hidden = FALSE;
            cell.trainThree.text = trainString;
            cell.trainThreeLine.backgroundColor = color1;
        }
        i++;
            
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
