//
//  GuestServiceConfirmationVC.m
//  ClientApplication
//
//  Created by Chris Purtell on 1/23/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "GuestServiceConfirmationVC.h"
#import "JSONKit.h"

@interface GuestServiceConfirmationVC ()

@end

@implementation GuestServiceConfirmationVC

@synthesize testLabel;
@synthesize maintenanceService;
@synthesize tableView;
@synthesize aUser;


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
    
    aUser = [[User alloc] init];
	// Do any additional setup after loading the view.
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    [objectManager getObjectsAtPath:@"/status/user_timeline/RestKit"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                NSArray* statuses = [mappingResult array];
                                NSLog(@"Loaded statuses: %@", statuses);
                               // _statuses = statuses;
                                if(self.isViewLoaded)
                                    [self.tableView reloadData];
                            }
                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                message:[error localizedDescription]
                                                                               delegate:nil
                                                                      cancelButtonTitle:@"OK"
                                                                      otherButtonTitles:nil];
                                [alert show];
                                NSLog(@"Hit error: %@", error);
                            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction:(id)sender 
    {
    //[testLabel setText:[self.maintenanceService name]];
    aUser = [[User alloc] init];;
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
    
    NSURL *aURL = [NSURL URLWithString: @"http://localhost:8080/fasserve/admintool/authenticateUser"];
    
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
