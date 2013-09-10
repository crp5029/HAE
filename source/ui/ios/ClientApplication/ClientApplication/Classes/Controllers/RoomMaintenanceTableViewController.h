//
//  RoomMaintenanceTableViewController.h
//  Client
//
//  Created by Chris Purtell on 1/20/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaintenanceService.h"
#import "RESTConstructor.h"

@interface RoomMaintenanceTableViewController : UITableViewController{
    IBOutlet UILabel *testLabel;
}


@property (nonatomic, strong) NSMutableArray *maintenanceServices;
@property (nonatomic, strong) NSString *maintenanceServiceName;
@property (nonatomic, strong) MaintenanceService *maintenanceService;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
//@property (nonatomic, strong) NSString *test;
//@property (strong, nonatomic) IBOutlet UITableViewCell *maintenanceServiceCell;

//@property (strong, nonatomic) IBOutlet UILabel *testLabel;

@end
