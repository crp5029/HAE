//
//  UnauthenticatedSegue.m
//  ClientApplication
//
//  Created by Purtell, Christopher on 3/25/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "UnauthenticatedSegue.h"

@implementation UnauthenticatedSegue

- (void) perform {
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
    completion:NULL];

}

@end
