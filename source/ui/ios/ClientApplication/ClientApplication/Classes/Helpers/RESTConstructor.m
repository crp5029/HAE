//
//  RESTConstructor.m
//  ClientApplication
//
//  Created by Chris Purtell on 9/10/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "RESTConstructor.h"

@implementation RESTConstructor

@synthesize postRequestMapping;
@synthesize requestDescriptor;
@synthesize responseMapping;
@synthesize errorDescriptor;
@synthesize errorMapping;
@synthesize responseDescriptor;
@synthesize statusCodes;
@synthesize objectManager;
@synthesize operation;
@synthesize request;
@synthesize requestMappingDictionary;
@synthesize responseMappingDictionary;
@synthesize mappingClass;
@synthesize requestURL;
@synthesize aRequest;


- (NSObject *)testGet
{
    aRequest = [MaintenanceRequest new];
    [aRequest setDescription:@"TEST"];
    //[aRequest setDescription:[txtViewData text]];
    
    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    postRequestMapping = [RKObjectMapping requestMapping ]; // Shortcut for [RKObjectMapping mappingForClass:[NSMutableDictionary class] ]
    
    /*[postRequestMapping addAttributeMappingsFromDictionary:@{
     @"description" : @"description"
     }];*/
    
    [postRequestMapping addAttributeMappingsFromDictionary:requestMappingDictionary];
    
    // Now configure the request descriptor
    requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:[MaintenanceRequest class] rootKeyPath:nil];
    
    responseMapping = [RKObjectMapping mappingForClass:[MaintenanceRequest class]];
    [responseMapping addAttributeMappingsFromDictionary:responseMappingDictionary];
    //Configure Response descriptor
   /* responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping pathPattern:@"/hae/admintool/getMaintenanceRequests" keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
    */
     responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping pathPattern:requestURL keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    [errorMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error" toKeyPath:@"errorMessage"]];
    
    statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    errorDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:errorMapping pathPattern:nil keyPath:@"errors" statusCodes:statusCodes];
    
    
    objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    [objectManager addResponseDescriptor:errorDescriptor];
    objectManager.requestSerializationMIMEType=RKMIMETypeJSON;
    
     request = [objectManager requestWithObject:aRequest method:RKRequestMethodPOST path:requestURL parameters:nil];
    
    operation = [objectManager objectRequestOperationWithRequest:request
                                                                                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                                                       NSObject *aARequest = mappingClass;
                                                                                       
                                                                                       
                                                                                       
                                                                                       NSArray* statuses = [mappingResult array];
                                                                                       NSLog(@"DESCRIPTION: %@", statuses);
                                                                                       mappingClass = statuses.lastObject;
                                                                                        NSLog(@"ARRAY SIZE %u", statuses.count);
                                                                                       //NSLog(@"ID: %@", aARequest.tableId);
                                                                                      // NSLog(@"DESCRIPTION: %@", aARequest.description);
                                                                                       NSLog(@"Success block: %@", mappingResult);
                                                                                       /* NSEnumerator *enumerator = [statuses objectEnumerator];
                                                                                        MaintenanceRequest *aTest = [MaintenanceRequest new];
                                                                                        
                                                                                        while (aTest = [enumerator nextObject]) {
                                                                                        NSLog(@"aTest:  %@", aTest.tableId);
                                                                                        NSLog(@"aTest:  %@", aTest.description);
                                                                                        }*/
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    [objectManager enqueueObjectRequestOperation:operation];
    
    return mappingClass;
}
@end

