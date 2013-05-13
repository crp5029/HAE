//
//  CreateAccountViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 5/12/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuestService.h"

@interface CreateAccountViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) GuestService *guestService;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) int *x;
@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) UILabel *label;



- (IBAction)backButton:(id)sender;
@end
