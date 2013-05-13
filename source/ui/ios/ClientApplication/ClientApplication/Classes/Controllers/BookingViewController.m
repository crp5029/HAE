//
//  BookingViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 5/13/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "BookingViewController.h"

@interface BookingViewController ()

@end

@implementation BookingViewController
@synthesize separateLabel;
@synthesize scheduleHelpView;
@synthesize contactButton;

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
    scheduleHelpView.layer.cornerRadius = 10.0f;
    scheduleHelpView.layer.masksToBounds = YES;
    contactButton.layer.cornerRadius = 10.0f;
    contactButton.layer.masksToBounds = YES;
    separateLabel.layer.borderColor = [UIColor blackColor].CGColor;
    separateLabel.layer.borderWidth = 1.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
