//
//  UnauthenticatedNCViewController.m
//  ClientApplication
//
//  Created by Purtell, Christopher on 3/25/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "UnauthenticatedNVC.h"

@interface UnauthenticatedNVC ()

@end

@implementation UnauthenticatedNVC

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
    NSLog(@"TESTTTT");
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"TESTTTT");
    [self performSegueWithIdentifier:@"segueAuthenticate" sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueAuthenticate"]) {
        
        LoginViewController *destViewController = [segue destinationViewController];
        
        
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
