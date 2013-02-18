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
         @"description" : @"description",
         }];
        
        // Now configure the request descriptor
        RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:postRequestMapping objectClass:[MaintenanceRequest class] rootKeyPath:nil];
        
        
        //Configure Response mapping
        /*RKObjectMapping *responseUserMapping = [RKObjectMapping mappingForClass:[MaintenanceRequest class]];
         [responseUserMapping addAttributeMappingsFromDictionary:@{
         @"userid" : @"userid",
         @"password": @"password",
         @"isAdmin": @"isAdmin",
         @"vendor": @"vendor",
         @"customer":@"customer"}];
         */
        
        //Configure Response descriptor
        //RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseUserMapping pathPattern:@"/hae/admintool/authenticateUser" keyPath:nil statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        
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
                                                                                           //User *aAUser = [User new];
                                                                                           //NSArray* statuses = [mappingResult array];
                                                                                           //aAUser = statuses.lastObject;
                                                                                           //NSLog(@"Loaded statuses: %@", aAUser.isAdmin);
                                                                                           NSLog(@"Success block: %@", mappingResult);
                                                                                       } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                           NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                       }];
        
        [objectManager enqueueObjectRequestOperation:operation];
    //[testLabel setText:[self.maintenanceService name]];
  /*  aUser = [[User alloc] init];;
    aUser.userid = @"fsadmin";
    aUser.password = @"test123";
    
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
    
    NSURL *aURL = [NSURL URLWithString: @"http://localhost:8080/hae/admintool/authenticateUser"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:aURL];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:jsonData];
    
    // print json:
    NSLog(@"JSON summary: %@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
  */
    
}

//Note: you cannot change the delegate method signatures, as you did (your's returns an NSData object)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
   // [self.responseData appendData:data]
   // [self.responseData appendData:data]
    //[testLabel setText:@"WORKED"];
    
    NSMutableData *responseData = [[NSMutableData alloc] init];
    
    
   // [testLabel setText:@"WORKED"];
    //data
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Now that the connection was successfully terminated, do the real work.
}
@end
