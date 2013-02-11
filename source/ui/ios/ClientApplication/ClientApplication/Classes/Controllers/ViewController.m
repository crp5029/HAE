//
//  ViewController.m
//  Client
//
//  Created by Chris Purtell on 1/16/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testButton {
    UIAlertView *alert = [[UIAlertView alloc]
                          
                          initWithTitle:@"The Title"
                          message:@"The Message"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Button1",@"Button2", nil];
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
    }
    if (buttonIndex == 2){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com"]];
    }
}

@end
