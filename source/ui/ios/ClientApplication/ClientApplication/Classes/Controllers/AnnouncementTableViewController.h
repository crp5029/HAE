//
//  AnnouncementTableViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuestService.h"

@interface AnnouncementTableViewController : UITableViewController
- (IBAction)backButton:(id)sender;
@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) NSString *guestServiceName;
@property (nonatomic, strong) GuestService *guestService;



@end
