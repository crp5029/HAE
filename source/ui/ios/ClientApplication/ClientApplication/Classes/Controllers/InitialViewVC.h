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
#import "DatabaseAuthentication.h"
#import "LoginViewController.h"

@interface InitialViewVC : UIViewController <UITextViewDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UITextField *userIdText;
@property (strong, nonatomic) IBOutlet UITextField *sessionKeyText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (nonatomic, strong) User *aUser;
- (IBAction)activateAccountButton:(id)sender;
- (IBAction)loginButton:(UIButton *)sender;

@end
