//
//  GuestServiceConfirmationVC.m
//  ClientApplication
//
//  Created by Chris Purtell on 1/23/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "GuestServiceConfirmationVC.h"

@interface GuestServiceConfirmationVC ()

@end

@implementation GuestServiceConfirmationVC 

@synthesize testLabel;
@synthesize maintenanceService;
@synthesize tableView;
@synthesize aRequest;
@synthesize txtViewData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //descriptionTextView = [[UITextView alloc] init];
    //descriptionTextView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textViewReturn:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [txtViewData resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)testAction:(id)sender 
    {
        aRequest = [MaintenanceRequest new];
        [aRequest setDescription:[txtViewData text]];
        // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
        RKObjectMapping *postRequestMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
        [postRequestMapping addAttributeMappingsFromDictionary:@{
         @"description" : @"description"
         }];
        
        // Now configure the request descriptor
        RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:[MaintenanceRequest class] rootKeyPath:nil];
        
        
        RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
        [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error" toKeyPath:@"errorMessage"]];
        
        NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
        RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping pathPattern:nil keyPath:@"errors" statusCodes:statusCodes];
        
        
        RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
        [objectManager addRequestDescriptor:requestDescriptor];
        // [objectManager addResponseDescriptor:responseDescriptor];
        [objectManager addResponseDescriptor:errorDescriptor];
        objectManager.requestSerializationMIMEType=RKMIMETypeJSON;
        
        NSMutableURLRequest *request = [objectManager requestWithObject:aRequest method:RKRequestMethodPOST path:@"/hae/admintool/processNewMaintenanceTicket" parameters:nil];
        
        
        RKObjectRequestOperation *operation = [objectManager objectRequestOperationWithRequest:request
                                                                                       success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                                                           NSLog(@"Success block: %@", mappingResult);
                                                                                       } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                           NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                       }];
        
        [objectManager enqueueObjectRequestOperation:operation];
}

- (IBAction)testGet:(UIButton *)sender
{
    aRequest = [MaintenanceRequest new];
    [aRequest setDescription:[txtViewData text]];
    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    RKObjectMapping *postRequestMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
    [postRequestMapping addAttributeMappingsFromDictionary:@{
     @"description" : @"description"
     }];
    
    // Now configure the request descriptor
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:[MaintenanceRequest class] rootKeyPath:nil];
    
     RKObjectMapping *responseMaintenanceMapping = [RKObjectMapping mappingForClass:[MaintenanceRequest class]];
     [responseMaintenanceMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"tableId",
     @"description" : @"description"
     }];
     
     //Configure Response descriptor
     RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMaintenanceMapping pathPattern:@"/hae/admintool/getMaintenanceRequests" keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
     
    
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error" toKeyPath:@"errorMessage"]];
    
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    RKResponseDescriptor *errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping pathPattern:nil keyPath:@"errors" statusCodes:statusCodes];
    
    
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager addResponseDescriptor:errorDescriptor];
    objectManager.requestSerializationMIMEType=RKMIMETypeJSON;
    
    NSMutableURLRequest *request = [objectManager requestWithObject:aRequest method:RKRequestMethodPOST path:@"/hae/admintool/getMaintenanceRequests" parameters:nil];
    
    RKObjectRequestOperation *operation = [objectManager objectRequestOperationWithRequest:request
                                                                                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                                                       MaintenanceRequest *aARequest = [MaintenanceRequest new];
                                                                                       NSArray* statuses = [mappingResult array];
                                                                                       aARequest = statuses.lastObject;
                                                                                      /* NSLog(@"ARRAY SIZE %u", statuses.count);
                                                                                       NSLog(@"ID: %@", aARequest.tableId);
                                                                                       NSLog(@"DESCRIPTION: %@", aARequest.description);
                                                                                       NSLog(@"Success block: %@", mappingResult);*/
                                                                                       NSEnumerator *enumerator = [statuses objectEnumerator];
                                                                                       MaintenanceRequest *aTest = [MaintenanceRequest new];
                                                                                       
                                                                                       while (aTest = [enumerator nextObject]) {
                                                                                           NSLog(@"aTest:  %@", aTest.tableId);
                                                                                           NSLog(@"aTest:  %@", aTest.description);
                                                                                       }
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    [objectManager enqueueObjectRequestOperation:operation];
}
@end
