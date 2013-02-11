//
//  AppDelegate.h
//  ClientApplication
//
//  Created by Chris Purtell on 1/20/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuestService.h"
#import "User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *uiTabBarController;
/*@property (nonatomic, strong) NSMutableArray *guestServices;
@property (nonatomic, strong) GuestService *guestService;
*/
@end