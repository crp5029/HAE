//
//  GuestServiceConfirmationVC.h
//  ClientApplication
//
//  Created by Chris Purtell on 1/23/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomMaintenanceTableViewController.h"
#import "MaintenanceRequest.h"
#import <RestKit/RestKit.h>

@interface GuestServiceConfirmationVC : UIViewController <UITextViewDelegate> {
    UITextView *txtViewData;
    
}

@property (strong, nonatomic) IBOutlet UIButton *testButton;

@property (strong, nonatomic) IBOutlet UILabel *testLabel;

@property (nonatomic, strong) MaintenanceService *maintenanceService;
@property (nonatomic, strong) MaintenanceRequest *aRequest;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

- (IBAction)testAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *txtViewData;

@end
