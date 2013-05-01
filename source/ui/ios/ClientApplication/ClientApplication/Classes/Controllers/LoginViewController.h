//
//  LoginViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 3/25/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "MainTabBarController.h"
#import "User.h"
#import "DatabaseAuthentication.h"
#import "LoginViewController.h"
#import "KBKeyboardHandler.h"
#import "KBKeyboardHandlerDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController : UIViewController<KBKeyboardHandlerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userIdText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (nonatomic, strong) User *aUser;
- (IBAction)loginButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *separateLabel;

@end
