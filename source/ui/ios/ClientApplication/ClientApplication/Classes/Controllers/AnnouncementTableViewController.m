//
//  AnnouncementTableViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AnnouncementTableViewController.h"

@interface AnnouncementTableViewController (){
    bool *sectionOpen[3];
}

@end

@implementation AnnouncementTableViewController
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
    guestService.name = @"News";
    guestService.enabled = TRUE;
    guestService.description = @"THIS IS A FUCKING TEST";
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Indulge";
    guestService.enabled = TRUE;
    guestService.description = @"fdsadfdsafdsafdsafdsafdsafdsafdsafdsaffdsafsa";
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Follow Us";
    guestService.enabled = TRUE;
    guestService.description = @"fdsadfdsafdsafdsafdsafdsafdsafdsafdsaffdsafsa";
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
    
    static NSString *MyIdentifier = @"guestCell";
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
	if (sectionOpen[indexPath.row]) {
		return 240;///it's open
	} else {
		return 45;///it's closed
	}
    
}
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ///turn them all off
	sectionOpen[0]=NO;
	sectionOpen[1]=NO;
	sectionOpen[2]=NO;
    
	///open this one
	sectionOpen[indexPath.row]=YES;
    
    ///animate the opening and expand the row
	[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    UITableViewCell *cell = (UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text=@"TEST";
    
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
