//
//  GuestServicesTableViewController.m
//  Client
//
//  Created by Chris Purtell on 1/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "GuestServicesTableViewController.h"
#import "RoomMaintenanceTableViewController.h"


@interface GuestServicesTableViewController ()

@end

@implementation GuestServicesTableViewController

@synthesize maintenanceServices;
@synthesize maintenanceService;
@synthesize guestServices;
@synthesize guestService;

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

    guestService = [[GuestService alloc] init];
    guestServices = [[NSMutableArray alloc] init];
    guestService.name = @"Schedule Wakeup Call";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Room Maintenance";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Service Complaint";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];

/*
GuestService *aService = [self.guestServices objectAtIndex:0];
testLabel.text = aService.name;
*/
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [guestServices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCell"];
	//guestService = [self.guestServices objectAtIndex:indexPath.row];
	//cell.textLabel.text = guestService.name;
    //GuestService *service = [self.guestServices objectAtIndex:indexPath.row];
	//cell.textLabel.text = service.name;
    
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    GuestService *service = [guestServices objectAtIndex:indexPath.row];
    cell.textLabel.text = service.name;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self performSegueWithIdentifier:@"segue1" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"segue2" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue2"]) {
        [maintenanceServices removeAllObjects];
        
        
       /*
        RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
        self.messageText = @"fddsasdasdassfds";
        maintenanceService = [[MaintenanceService alloc] init];
        maintenanceService.name = self.messageText;
        destViewController.maintenanceService = self.maintenanceService;
       */
        
        RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
        maintenanceServices = [[NSMutableArray alloc] init];
        
        maintenanceService = [[MaintenanceService alloc] init];
        maintenanceService.name = @"Turn Down Service";
        maintenanceService.enabled = YES;
        [maintenanceServices addObject:maintenanceService];
        
        maintenanceService = [[MaintenanceService alloc] init];
        maintenanceService.name = @"Linen Replacement";
        maintenanceService.enabled = YES;
        [maintenanceServices addObject:maintenanceService];
        
        destViewController.maintenanceServices = self.maintenanceServices;

    }
}

@end
