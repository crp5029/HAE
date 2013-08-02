//
//  GuestServicesTableViewController.h
//  Client
//
//  Created by Chris Purtell on 1/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaintenanceService.h"
#import "GuestService.h"

@interface GuestServicesTableViewController : UITableViewController
{
    IBOutlet UILabel *testLabel;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *maintenanceServices;
@property (nonatomic, strong) MaintenanceService *maintenanceService;
@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) GuestService *guestService;

@end
