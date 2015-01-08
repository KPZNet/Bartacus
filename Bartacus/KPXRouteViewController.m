//
//  KPXRouteViewController.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/21/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXRouteViewController.h"
#import "KPXRouteStationSelectTableViewController.h"
#import "KPXRouteFair.h"

@interface KPXRouteViewController ()

@property BOOL toStationSelect;
@property BOOL fromStationSelect;

@property KPXStation* fromStation;
@property KPXStation* toStation;

@end

@implementation KPXRouteViewController

- (IBAction)unwindRouteStationSelect:(UIStoryboardSegue *)segue
{
    UIViewController* sourceViewController = segue.sourceViewController;
    
    if ([sourceViewController isKindOfClass:[KPXRouteStationSelectTableViewController class]])
    {
        KPXRouteStationSelectTableViewController* stationSelect = (KPXRouteStationSelectTableViewController*)segue.sourceViewController;
        
        if(_fromStationSelect)
        {
            _fromStation = stationSelect.selectedStation;
            _fromStationCell.textLabel.text = stationSelect.selectedStation.name;
        }
        else if(_toStationSelect)
        {
            _toStation = stationSelect.selectedStation;
            _toStationCell.textLabel.text = stationSelect.selectedStation.name;
        }
        if( _fromStation && _toStation)
        {
            [self CalculateRouteInfo];
        }
    }

}

-(void)CalculateRouteInfo
{
    KPXRouteFair* routeFair = [KPXRouteFair new];
    [routeFair GetRouteFair: _fromStation.abbrev : _toStation.abbrev];
    
    NSString* fairAmounts = [NSString stringWithFormat:@"$%@, Discount Fair $%@", routeFair.routeFair, routeFair.routeFairClipperDiscount];
    
    _fairAmount.textLabel.text = @"Fair Amount";
    _fairAmount.detailTextLabel.text = fairAmounts;
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSInteger rows = 0;
    
    if(section == 0)
    {
        rows = 2;
    }
    if(section == 1)
    {
        rows = 4;
    }
    return rows;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _toStationSelect = FALSE;
    _fromStationSelect = FALSE;
    
    if( indexPath.section == 0 && indexPath.row == 0)
    {
        _fromStationSelect = TRUE;
        [self performSegueWithIdentifier: @"ShowFromStationSelect" sender: self];
    }
    if( indexPath.section == 0 && indexPath.row == 1)
    {
        _toStationSelect = TRUE;
        [self performSegueWithIdentifier: @"ShowToStationSelect" sender: self];
    }
    
    
    

}
@end
