//
//  GuestServicesTableViewController.m
//  Client
//
//  Created by Chris Purtell on 1/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "InitialLoginVC.h"
#import "RoomMaintenanceTableViewController.h"


@interface InitialLoginVC ()

@end

@implementation InitialLoginVC

@synthesize maintenanceServices;
@synthesize maintenanceService;
@synthesize guestServices;
@synthesize guestService;
@synthesize tableView;
@synthesize uiView;
@synthesize informationButton;

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

/*- (void)loadView {

    //self.view = [[UIView alloc] initWithFrame:CGRectZero];
    //self.view.backgroundColor = [UIColor whiteColor];
    


    //UIView *uiNewView = [[UIView alloc]initWithFrame:CGRectMake(10,10,150,50)];
    UIView *uiNewView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    InitialTableVC *myViewController = [[InitialTableVC alloc] initWithNibName:@"MyVC" bundle:nil];
    myViewController.view.frame = CGRectMake(0, 0, uiNewView.frame.size.width, uiNewView.frame.size.height);
    
    //UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    //newLabel.text = @"TEST";
    
   // self.uiView = uiNewView;
   
    

    
   UITableView *tableNewView = [[UITableView alloc]
                                 initWithFrame:CGRectMake(10, 200, 300, 200)
                                 style:UITableViewStylePlain
                                 ];
    tableNewView.dataSource = self;
    tableNewView.delegate = self;
    
   uiNewView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight
    ;*/
    
    
   // [uiNewView addSubview:newLabel];
    // self.view = uiNewView;
    
    //InitialTableVC *myViewController = [[InitialTableVC alloc] initWithNibName:@"MyView" bundle:nil];

    
  //  self.tableView = tableNewView;
   // [self.view addSubview:tableView];
    //[self.view addSubview:myViewController.view];
    //[uiView addSubview:tableView];
   // [self.view addSubview:uiView];
    //[self.view addSubview:tableView];
    
    
   // [self.view addSubview:uiNewView];
 /*   [uiNewView addSubview:myViewController.view];
    self.view = uiNewView;
    
    
    [super loadView];
    
}*/

- (void)viewDidLoad
{
    guestService = [[GuestService alloc] init];
    guestServices = [[NSMutableArray alloc] init];
    guestService.name = @"Login";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Browse Application";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Activate Account";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
  /*
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    newLabel.text = @"HMM";
    
    [self.uiView addSubview:newLabel];
    */
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:uiView];
    [self.view addSubview:tableView];
    [super viewDidLoad];
    
    UIImage *informationButtonImage = [UIImage imageNamed:@"Information-Icon.png"];
    [informationButton setImage:informationButtonImage forState:(UIControlStateNormal)];
    
    //informationButton = [[UIButton alloc] ]
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
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        UIImageView *cellBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellBG.png"]];
        GuestService *service = [guestServices objectAtIndex:indexPath.row];
        cell.backgroundView = cellBG;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = service.name;
        
        return cell;
    }
    return nil;
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
        [self performSegueWithIdentifier:@"segueLogin" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"segue2" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueLogin"]) {
        [maintenanceServices removeAllObjects];
        
        RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];

    }
}

@end
