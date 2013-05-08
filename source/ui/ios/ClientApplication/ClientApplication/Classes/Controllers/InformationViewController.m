//
//  InformationViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)notificationsTransitionButton:(id)sender {
    [self performSegueWithIdentifier:@"segueUnauthenticatedNotifications" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueUnauthenticatedNotifications"]) {
        //[maintenanceServices removeAllObjects];
        //UnauthenticatedNVC *destViewController = [segue destinationViewController];
        // UnauthenticatedNVC *destViewController = (UnauthenticatedNVC *)segue.destinationViewController;
        //[self presentViewController:destViewController animated:(TRUE) completion:NULL];
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                     NotificationsNavigationViewController *destViewController = [[NotificationsNavigationViewController alloc] init];
                                     destViewController = (NotificationsNavigationViewController *)segue.destinationViewController;
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
