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

@interface InitialViewVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userIdText;
@property (strong, nonatomic) IBOutlet UITextField *sessionKeyText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)activateAccountButton:(id)sender;
- (IBAction)loginButton:(id)sender;

@end
