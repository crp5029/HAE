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
@synthesize requestURL;
@synthesize aRequest;
@synthesize requestResult;


- (RKObjectRequestOperation *)testGet:(NSString *)className
{
    aRequest = [MaintenanceRequest new];
    requestResult = [[NSArray alloc] init];
    [aRequest setDescription:@"TEST"];
    
    Class classFromString = NSClassFromString(className);

    // Configure a request mapping for our Article class. We want to send back title, body, and publicationDate
    postRequestMapping = [RKObjectMapping requestMapping ]; 
    
    [postRequestMapping addAttributeMappingsFromDictionary:requestMappingDictionary];
    
    // Now configure the request descriptor
    requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:classFromString rootKeyPath:nil];
    
    responseMapping = [RKObjectMapping mappingForClass:classFromString];
    [responseMapping addAttributeMappingsFromDictionary:responseMappingDictionary];
    //Configure Response descriptor

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
                                        //requestResult = [mappingResult array];
                                        //NSLog(@"ARRAY COUNT: %lu", (unsigned long)requestResult.count);
                                        //NSLog(@"Success block: %@", requestResult);
                                    }
                                    failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                        NSLog(@"Failed with error: %@", [error localizedDescription]);
                                    }];
    
    [objectManager enqueueObjectRequestOperation:operation];

    return operation;
}

/*- (id)makeObjectOfClass:(Class)aClass
{
    assert([aClass instancesRespondToSelector:@selector(reset)]);
    //id *newInstance = [aClass createInstance];
   // [managedObjects addObject:newInstance];
    return newInstance;
}*/
@end

