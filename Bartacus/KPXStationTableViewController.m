//
//  KPXStationTableViewController.m
//  Bartacus
//
//  Created by Ken Ceglia on 5/11/14.
//  Copyright (c) 2014 Ken Ceglia. All rights reserved.
//

#import "KPXStationTableViewController.h"
#import "KPXStationList.h"
#import "KPXStation.h"
#import "KPXStationDepartures.h"
#import "KPXStationDeparturesViewController.h"
#import "KPXAppDelegate.h"

@interface KPXStationTableViewController ()

@property KPXStationList* bartStations;
@property KPXStation* selectedStation;

@end

@implementation KPXStationTableViewController

- (IBAction)unwindDepartureStationSelect:(UIStoryboardSegue *)segue
{
    
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
    
    KPXAppDelegate* appdel =  (KPXAppDelegate*)(UIResponder*)[UIApplication sharedApplication].delegate;
    _bartStations = appdel.stations;
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numCells = 0;
    numCells = [_bartStations.stationDictionary count];
    return numCells;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StationCell" forIndexPath:indexPath];
    // Configure the cell...

    KPXStation* bartStation = [_bartStations.stationArray objectAtIndex: indexPath.row];
    cell.textLabel.text = bartStation.name;

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    KPXStationDeparturesViewController* stationDeparturesView = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
    
    stationDeparturesView.station = _selectedStation;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *barts = [_bartStations.stationDictionary allValues];
    _selectedStation = [barts objectAtIndex: indexPath.row];
    
    
    [self performSegueWithIdentifier: @"showArrivalTrains" sender: self];
}


@end
