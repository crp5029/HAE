//
//  InitialViewVC.m
//  ClientApplication
//
//  Created by Chris Purtell on 2/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "InitialViewVC.h"

@interface InitialViewVC ()

@end

@implementation InitialViewVC

@synthesize userIdText;
@synthesize sessionKeyText;
@synthesize passwordText;
@synthesize aUser;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    RKLogConfigureByName("RestKit", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)activateAccountButton:(id)sender {
    
}

- (IBAction)loginButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segueLogin" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueLogin"]) {
        //[maintenanceServices removeAllObjects];
        //UnauthenticatedNVC *destViewController = [segue destinationViewController];
        // UnauthenticatedNVC *destViewController = (UnauthenticatedNVC *)segue.destinationViewController;
        //[self presentViewController:destViewController animated:(TRUE) completion:NULL];
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                     UnauthenticatedNVC *destViewController = [[UnauthenticatedNVC alloc] init];
                                     destViewController = (UnauthenticatedNVC *)segue.destinationViewController;
                                     [self presentViewController:destViewController animated:(TRUE) completion:NULL];
                                 }];
        
        /*
         RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
         self.messageText = @"fddsasdasdassfds";
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = self.messageText;
         destViewController.maintenanceService = self.maintenanceService;
         
         
         RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
         maintenanceServices = [[NSMutableArray alloc] init];
         
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = @"New Request";
         maintenanceService.enabled = YES;
         [maintenanceServices addObject:maintenanceService];
         
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = @"Maintenance History";
         maintenanceService.enabled = YES;
         [maintenanceServices addObject:maintenanceService];
         
         destViewController.maintenanceServices = self.maintenanceServices;   */
        
    }
}
@end
