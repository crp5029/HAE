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
    // Initialize RestKit
   /* RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[User class]];
    [userMapping addAttributeMappingsFromDictionary:@{
     @"userid": @"userid",
     @"password": @"password",
     }];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                                                        pathPattern:nil
                                                                                        keyPath:@"user"
                                                                                        statusCodes:
                                                                                        RKStatusCodeIndexSetForClass
                                                                                        (RKStatusCodeClassSuccessful)];
    NSURL *URL = [NSURL URLWithString:@"http://localhost:8080/hae/admintool/authenticateUser"];
   // RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    */
    
    
    
    
  
    //NEWWWWWWWWW
    
    User *aUser = [User new];
    aUser.userid = @"fsadmin";
    aUser.password = @"test123";
  /*
    NSDictionary *newDatasetInfo = [NSDictionary dictionaryWithObjectsAndKeys:[aUser userid], @"userid", [aUser password], @"password",nil]
    ;
    NSError *err = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:newDatasetInfo options:NSJSONWritingPrettyPrinted error:&err];
    NSString *jsonStr = nil;
    if (! jsonData) {
        NSLog(@"Got an error: %@", err);
    } else {
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

  */  
    
    //let AFNetworking manage the activity indicator
    //[AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // Initialize HTTPClient
   // NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080"];
   // AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    //we want to work with JSON-Data
   // [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    
    
    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    RKObjectMapping *postUserMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
    //[userMapping addAttributeMappingsFromArray:@[ @"userid", @"password"]];
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
     @"isAdmin": @"isAdmin"}];
    
    //Configure Response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseUserMapping pathPattern:nil keyPath:@"Response" statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error" toKeyPath:@"errorMessage"]];
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping pathPattern:nil keyPath:@"errors" statusCodes:statusCodes];

    
    

    

    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager addResponseDescriptor:errorDescriptor];
    NSMutableURLRequest *request = [objectManager requestWithObject:aUser method:RKRequestMethodPOST path:@"/hae/admintool/authenticateUser" parameters:nil];
    
    
    
 /*   AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    [client setParameterEncoding:AFJSONParameterEncoding];
   */ 
    
    RKObjectRequestOperation *operation = [objectManager objectRequestOperationWithRequest:request
                                                                                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                                                       NSLog(@"Success block: %@", mappingResult);
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    //[RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/plain"];
    
    [objectManager enqueueObjectRequestOperation:operation];
    
    
    //[[RKObjectManager sharedManager] postObject:aUser path:@"http://localhost:8080/hae/admintool/authenticateUser" parameters:nil success:nil failure:nil];
    //This method takes care of both the serialization and object mapping
   // [[RKObjectManager sharedManager].mappingProvider registerMapping:objectMapping withRootKeyPath:@"user"];

    
   //NEWWWWWW
    
    
    
    
    
    
    
 /*
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    RKObjectRequestOperation *objectRequestOperation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[ responseDescriptor ]];
    [objectRequestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        RKLogInfo(@"Load collection of Users: %@", mappingResult.array);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        RKLogError(@"Operation failed with error: %@", error);
    }];
    
    [objectRequestOperation start];
 */   
    
    
    
    // Enable Activity Indicator Spinner
   // [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // Initialize managed object store
   /* NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    objectManager.managedObjectStore = managedObjectStore;
    */
    // Setup our object mappings
    /**
     Mapping by entity. Here we are configuring a mapping by targetting a Core Data entity with a specific
     name. This allows us to map back Twitter user objects directly onto NSManagedObject instances --
     there is no backing model class!
     */
    
    
    
    /*   GOOD CODE
    RKEntityMapping *userMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:managedObjectStore];
    userMapping.identificationAttributes = @[ @"userid" ];
    [userMapping addAttributeMappingsFromDictionary:@{
     @"id": @"userid",
     @"pwd": @"password",
     }];
     
     
     
     
     */
    
    // If source and destination key path are the same, we can simply add a string to the array
   //******* [userMapping addAttributeMappingsFromArray:@[ @"name" ]];
    
    
    // Register our mappings with the provider
    
  /*  RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                                                    pathPattern:nil
                                                                                    keyPath:@"user"
                                                                                    statusCodes:
                                                                                    RKStatusCodeIndexSetForClass
                                                                                    (RKStatusCodeClassSuccessful)];
   */
    //[objectManager addResponseDescriptor:responseDescriptor];
    //self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreenI boundsSc autorelease]; ]]]
    
    
    
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
