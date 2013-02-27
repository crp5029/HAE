//
//  InitialViewVC.h
//  ClientApplication
//
//  Created by Chris Purtell on 2/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "User.h"
#import "MaintenanceRequest.h"

@interface InitialViewVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userIdText;
@property (strong, nonatomic) IBOutlet UITextField *sessionKeyText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (nonatomic, strong) User *aUser;
@property (nonatomic, strong) MaintenanceRequest *aRequest;
- (IBAction)activateAccountButton:(id)sender;
- (IBAction)loginButton:(id)sender;

@end
