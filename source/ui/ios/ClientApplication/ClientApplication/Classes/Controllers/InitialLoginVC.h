//
//  InitialTableVC.h
//  ClientApplication
//
//  Created by Chris Purtell on 3/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaintenanceService.h"
#import "GuestService.h"

@interface InitialLoginVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
{

}

@property (nonatomic, strong) NSMutableArray *maintenanceServices;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MaintenanceService *maintenanceService;
@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) GuestService *guestService;
@property (strong, nonatomic) IBOutlet UIView *uiView;




@end
