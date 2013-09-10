//
//  RESTConstructor.h
//  ClientApplication
//
//  Created by Chris Purtell on 9/10/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "MaintenanceRequest.h"

@interface RESTConstructor : NSObject

@property(nonatomic, strong) RKRequestDescriptor *requestDescriptor;
@property(nonatomic, strong) RKObjectMapping *postRequestMapping;
@property(nonatomic, strong) RKObjectMapping *responseMapping;

@property(nonatomic, strong) RKResponseDescriptor *responseDescriptor;
@property(nonatomic, strong) RKObjectMapping *errorMapping;
@property(nonatomic, strong) NSIndexSet *statusCodes;
@property(nonatomic, strong) RKResponseDescriptor *errorDescriptor;

@property(nonatomic, strong) RKObjectManager *objectManager;
@property(nonatomic, strong) NSMutableURLRequest *request;
@property(nonatomic, strong) RKObjectRequestOperation *operation;

//@property(nonatomic, strong) NSObject *aRequest;
@property(nonatomic, strong) NSDictionary *requestMappingDictionary;
@property(nonatomic, strong) NSDictionary *responseMappingDictionary;
@property(nonatomic, strong) NSObject *mappingClass;

@property(nonatomic, strong) NSString *requestURL;

@property (nonatomic, strong) MaintenanceRequest *aRequest;

- (NSObject *) testGet;









@end