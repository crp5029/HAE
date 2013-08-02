//
//  AccountViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 7/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaintenanceService.h"
#import "GuestService.h"

@interface AccountViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) UILabel *label;


@property (nonatomic, strong) NSMutableArray *maintenanceServices;
@property (nonatomic, strong) MaintenanceService *maintenanceService;
@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) GuestService *guestService;

@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, assign) NSInteger openSectionIndex;

@end
