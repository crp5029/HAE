//
//  LoginViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 3/25/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    KBKeyboardHandler *keyboard;
}

@synthesize userIdText;
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
    // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
   // keyboard = [[KBKeyboardHandler alloc] init];
    //keyboard.delegate = self;
    //keyboard = [[KBKeyboardHandler alloc] init];
    //keyboard.delegate = self;
    self.userIdText.delegate = self;
    self.passwordText.delegate = self;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)viewDidAppear:(BOOL)animated
{
    [self performSegueWithIdentifier:@"sequeAuthenticated" sender:self];
}*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:TRUE];
}
 
/*- (void)keyboardSizeChanged:(CGSize)delta
{
    // Resize / reposition your views here. All actions performed here
    // will appear animated.
    // delta is the difference between the previous size of the keyboard
    // and the new one.
    // For instance when the keyboard is shown,
    // delta may has width=768, height=264,
    // when the keyboard is hidden: width=-768, height=-264.
    // Use keyboard.frame.size to get the real keyboard size.
    
    // Sample:
    CGRect frame = self.view.frame;
    frame.size.height -= delta.height;
    self.view.frame = frame;
}*/

- (IBAction)loginButton:(id)sender {
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
                                                                                       
                                                                                       if([[dbA isValid] boolValue])
                                                                                       {
                                                                                           [userIdText setText:(@"WORKED")];
                                                                                           [self performSegueWithIdentifier:@"segueAuthenticated" sender:self];
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Authentication Error"
                                                                                                                                           message:@"Invalid Userid or Password"
                                                                                                                                          delegate:nil
                                                                                                                                 cancelButtonTitle:@"OK"
                                                                                                                                 otherButtonTitles:nil];
                                                                                           
                                                                                           [alert show];
                                                                                           
                                                                                           //LOOK INTO AUTOMATIC REFERENCE COUNTING
                                                                                           //[alert release];
                                                                                       }
                                                                                       
                                                                                   } failure: ^(RKObjectRequestOperation *operation, NSError *error) {
                                                                                       NSLog(@"Failed with error: %@", [error localizedDescription]);
                                                                                   }];
    
    operation.targetObject = nil;
    [objectManager enqueueObjectRequestOperation:operation];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueAuthenticated"]) {
        //[maintenanceServices removeAllObjects];
        
        LoginViewController *destViewController = [segue destinationViewController];
        
        
        /*
         RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
         self.messageText = @"fddsasdasdassfds";
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = self.messageText;
         destViewController.maintenanceService = self.maintenanceService;
         
         
         RoomMaintenanceTableViewController *destViewController = [segue destinationViewController];
         maintenanceServices = [[NSMutableArray alloc] init];
         
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = @"New Request";
         maintenanceService.enabled = YES;
         [maintenanceServices addObject:maintenanceService];
         
         maintenanceService = [[MaintenanceService alloc] init];
         maintenanceService.name = @"Maintenance History";
         maintenanceService.enabled = YES;
         [maintenanceServices addObject:maintenanceService];
         
         destViewController.maintenanceServices = self.maintenanceServices;   */
        
    }
}
@end
