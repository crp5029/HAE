//
//  InitialViewVC.m
//  ClientApplication
//
//  Created by Chris Purtell on 2/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "InitialViewVC.h"

@interface InitialViewVC ()

@end

@implementation InitialViewVC

@synthesize userIdText;
@synthesize sessionKeyText;
@synthesize passwordText;
@synthesize aUser;


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
    RKLogConfigureByName("RestKit", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)activateAccountButton:(id)sender {
    
}

- (IBAction)loginButton:(UIButton *)sender {
    aUser = [User new];
    [aUser setUserid:[userIdText text]];
    [aUser setPassword:[passwordText text]];
    
    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    RKObjectMapping *postRequestMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
    [postRequestMapping addAttributeMappingsFromDictionary:@{
     @"userid" : @"userid",
     @"password" : @"password",
     }];
    
    // Now configure the request descriptor
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:[User class] rootKeyPath:nil];
    
    RKObjectMapping *responseUserMapping = [RKObjectMapping mappingForClass:[DatabaseAuthentication class]];
    [responseUserMapping addAttributeMappingsFromDictionary:@{
     @"valid" : @"isValid"
     }];
    
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
                                                                                       //User *aAUser = [User new];
                                                                                       DatabaseAuthentication *dbA = [DatabaseAuthentication new];
                                                                                       NSArray* statuses = [mappingResult array];
                                                                                       NSLog(@"Statuses: %@", statuses);
                                                                                       dbA = statuses.lastObject;
                                                                                       NSLog(@"VALID???: %@", [dbA isValid]);
                                                                                       
                                                                                       /* NSLog(@"ARRAY SIZE %u", statuses.count);
                                                                                        NSLog(@"ID: %@", aARequest.tableId);
                                                                                        NSLog(@"DESCRIPTION: %@", aARequest.description);*/
                                                                                        NSLog(@"Mapping Result: %@", mappingResult);
                                                                                       
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    operation.targetObject = nil;
    [objectManager enqueueObjectRequestOperation:operation];
    
}
@end
