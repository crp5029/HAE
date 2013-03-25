//
//  LoginViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 3/25/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MainTabBarController *destViewController = [segue destinationViewController];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self performSegueWithIdentifier:@"sequeAuthenticated" sender:self];
}

@end
