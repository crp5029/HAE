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
@synthesize operation;
@synthesize requestResult;
@synthesize maintenanceRequest;

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
    [self getMaintenanceRequests];
    

}

- (void)getMaintenanceRequests
{
    maintenanceRequest = [[MaintenanceRequest alloc]init];
    RESTConstructor *restConstructor = [RESTConstructor alloc];

    restConstructor.requestMappingDictionary = @{
                                                 @"description" : @"description"
                                                 };
    restConstructor.responseMappingDictionary = @{
                                                  @"id" : @"tableId",
                                                  @"description" : @"description"
                                                  };
    restConstructor.requestURL = @"/hae/admintool/getMaintenanceRequests";

    operation = [restConstructor testGet:(NSStringFromClass([maintenanceRequest class]))];
    
    while(!operation.isFinished){
        //NSLog(@"WAITING....");
    }
    requestResult = [operation.mappingResult array];
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
    //NSLog(@"NumberOfRowsInSection: %d", [self.requestResult count]);
    return [self.requestResult count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maintenanceCell"];
	MaintenanceRequest *service = [self.requestResult objectAtIndex:indexPath.row];
	cell.textLabel.text = service.description;
    
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
        destViewController.maintenanceService = [requestResult objectAtIndex:selected];
        
        //[maintenanceServices removeAllObjects];
    }
}


@end
