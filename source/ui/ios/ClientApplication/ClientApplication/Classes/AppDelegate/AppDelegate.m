//
//  AppDelegate.m
//  Client
//
//  Created by Chris Purtell on 1/16/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>
#import "AppDelegate.h"
#import "GuestService.h"
#import "GuestServicesTableViewController.h"


@implementation AppDelegate {
    UIStoryboardSegue *segue;
}

@synthesize window;
@synthesize uiTabBarController;
@synthesize userid;
@synthesize password;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
    //NEWWWWWWWWW
    
    User *aUser = [User new];
    aUser.userid = @"fsadmin";
    aUser.password = @"test123"; 
    
    
    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    RKObjectMapping *postUserMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
    [postUserMapping addAttributeMappingsFromDictionary:@{
     @"userid" : @"userid",
     @"password" : @"password",
     }];

    // Now configure the request descriptor
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postUserMapping objectClass:[User class] rootKeyPath:nil];
    
    
    //Configure Response mapping
    RKObjectMapping *responseUserMapping = [RKObjectMapping mappingForClass:[User class]];
    [responseUserMapping addAttributeMappingsFromDictionary:@{
     @"userid" : @"userid",
     @"password": @"password",
     @"isAdmin": @"isAdmin",
     @"vendor": @"vendor",
     @"customer":@"customer"}];
    
    //Configure Response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseUserMapping pathPattern:@"/hae/admintool/authenticateUser" keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error" toKeyPath:@"errorMessage"]];
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping pathPattern:nil keyPath:@"errors" statusCodes:statusCodes];


    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager addResponseDescriptor:errorDescriptor];
    objectManager.requestSerializationMIMEType=RKMIMETypeJSON;
    
    NSMutableURLRequest *request = [objectManager requestWithObject:aUser method:RKRequestMethodPOST path:@"/hae/admintool/authenticateUser" parameters:nil];
    
    
    RKObjectRequestOperation *operation = [objectManager objectRequestOperationWithRequest:request
                                                                                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                                                       User *aAUser = [User new];
                                                                                       NSArray* statuses = [mappingResult array];
                                                                                       aAUser = statuses.lastObject;
                                                                                       NSLog(@"Loaded statuses: %@", aAUser.isAdmin);
                                                                                       NSLog(@"Success block: %@", mappingResult);
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    [objectManager enqueueObjectRequestOperation:operation];
    
  /*  WORKING REST CALL
   NSDictionary *newDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:[aUser userid], @"userid", [aUser password], @"password",nil];
    NSError *err = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:newDatasetInfo options:NSJSONWritingPrettyPrinted error:&err];
    NSString *jsonStr = nil;
    if (! jsonData) {
        NSLog(@"Got an error: %@", err);
    } else {
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSURL *aURL = [NSURL URLWithString: @"http://localhost:8080/hae/admintool/authenticateUser"];
    
    NSMutableURLRequest *requestTmp = [[NSMutableURLRequest alloc] init];
    [request setURL:aURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:jsonData];
    
    // print json:
    NSLog(@"JSON summary: %@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:requestTmp delegate:self];
    [connection start];
    */
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
	UINavigationController *navigationController = [[tabBarController viewControllers]objectAtIndex:2];
	//GuestServicesTableViewController *guestServicesTableViewController = [[navigationController viewControllers]objectAtIndex:0];

    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:
}

@end
