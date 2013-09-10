//
//  RoomMaintenanceTableViewController.m
//  Client
//
//  Created by Chris Purtell on 1/20/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "RoomMaintenanceTableViewController.h"
#import "MaintenanceService.h"
#import "GuestServiceConfirmationVC.h"

@interface RoomMaintenanceTableViewController ()


@end

@implementation RoomMaintenanceTableViewController

@synthesize maintenanceServices;
@synthesize maintenanceServiceName;
@synthesize maintenanceService;
//@synthesize testLabel;

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
    
    RESTConstructor *restConstructor = [RESTConstructor alloc];
    restConstructor.mappingClass = maintenanceService;
    restConstructor.requestMappingDictionary = @{
                                                 @"description" : @"description"
                                                 };
    restConstructor.responseMappingDictionary = @{
                                                  @"id" : @"tableId",
                                                  @"description" : @"description"
                                                  };
    restConstructor.requestURL = @"/hae/admintool/getMaintenanceRequests";
    
    NSObject *service = [NSObject alloc];
    service = [restConstructor testGet];
    NSLog(@"TESTING: %@", service.description);
    
    
    
    /*
     
    testLabel.text = self.maintenanceService.name;
    
    */
    
    //maintenanceService = [self.services objectAtIndex:0];
	//testLabel.text = self.maintenanceService.name;
    
    
    
    
    //MaintenanceService *service = [maintenanceServices objectAtIndex:0];
    //maintenanceService.name = @"dfsfsdafdasf";
    //maintenanceServiceName = maintenanceService.name;
    
    //maintenanceService.name = @"DFJDKSL";
  //  maintenanceService = [self.maintenanceServices objectAtIndex:0];
   // testLabel.text = self.maintenanceService.name;
    

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
    return [self.maintenanceServices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maintenanceCell"];
	MaintenanceService *service = [self.maintenanceServices objectAtIndex:indexPath.row];
	cell.textLabel.text = service.name;
    
    // Configure the cell...
    
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
    
   // testLabel.text=@"FDSFSDFDS";
   // if (indexPath.row == 0)
   // {
        [self performSegueWithIdentifier:@"confirmationSegue" sender:self];
        
   // }
 /*   else
    {
        [self performSegueWithIdentifier:@"segue2" sender:self];
    }*/
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"confirmationSegue"])
    {
        GuestServiceConfirmationVC *destViewController = [segue destinationViewController];
        NSInteger selected = [[self.tableView indexPathForSelectedRow] row];
        destViewController.maintenanceService = [maintenanceServices objectAtIndex:selected];
        
        //[maintenanceServices removeAllObjects];
    }
}


@end
