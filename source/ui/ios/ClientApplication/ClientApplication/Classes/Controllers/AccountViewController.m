//
//  AccountViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 7/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AccountViewController.h"


@interface AccountViewController ()

@end

@implementation AccountViewController


@synthesize x;
@synthesize labelArray;
@synthesize label;
@synthesize tableView;
@synthesize uiScrollView;
@synthesize aButton;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    labelArray = [[NSMutableArray alloc] init];
    
    aButton = [[StandardTableButton alloc] init];
    [aButton setTitle:@"hello world" forState:UIControlStateNormal];
    [aButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[self setAButton:aButton];
    [labelArray addObject:aButton];
    
   /* label = [[UILabel alloc] init];
    label.text = @"First Name";
    [self setLabel:label];
    [labelArray addObject:label];
   
    label = [[UILabel alloc] init];
    label.text = @"Last Name";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Street Name";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"City";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"State";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Zip Code";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Country";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Phone Number";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Email";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"User Name";
    [self setLabel:label];
    [labelArray addObject:label];
    
    label = [[UILabel alloc] init];
    label.text = @"Password";
    [self setLabel:label];
    [labelArray addObject:label];
   */ 
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 35, 250, 300)];
                 

    
    
    x = 0;
    /*  guestService = [[GuestService alloc] init];
     guestServices = [[NSMutableArray alloc] init];
     guestService.name = @"GRRR";
     guestService.enabled = TRUE;
     [self setGuestService:guestService];
     [guestServices addObject:guestService];
     guestService = [[GuestService alloc] init];
     guestService.name = @"Browse Application";
     guestService.enabled = TRUE;
     [self setGuestService:guestService];
     [guestServices addObject:guestService];
     guestService = [[GuestService alloc] init];
     guestService.name = @"Activate Account";
     guestService.enabled = TRUE;
     [self setGuestService:guestService];
     [guestServices addObject:guestService];
     
     guestService = [[GuestService alloc] init];
     guestService.name = @"One More Account";
     guestService.enabled = TRUE;
     [self setGuestService:guestService];
     [guestServices addObject:guestService];
     /*
     UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
     newLabel.text = @"HMM";
     
     [self.uiView addSubview:newLabel];
     */
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [uiScrollView addSubview:tableView];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view.
    [self.tableView flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [labelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellLabel = @"labelCell";
    UITableViewCell *cell;
    UITextField *textField;
    
    UIButton *textLabel;
    //UILabel *textLabel;
    
    self.x = self.x +1;
    //  for(int *y = 0; y < self.x; y++){
    //     NSLog(@"TEST");
    // }
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellLabel];
        textLabel = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, cell.frame.size.width-10, cell.frame.size.height / 2)];
        textLabel.backgroundColor = [UIColor redColor];
        //textLabel.font=[UIFont fontWithName:@"Arial" size:12];
        //textLabel.textColor = [UIColor redColor];
        textField = [[UITextField alloc] initWithFrame:CGRectMake(5, cell.frame.size.height / 2, cell.frame.size.width-10, cell.frame.size.height / 2)];
        textField.borderStyle = round(3.0);
        
        UIButton *aLabel = [labelArray objectAtIndex:indexPath.row];
        [textLabel setTitle:@"hello world" forState:UIControlStateNormal];
        //textLabel.text = aLabel.text;
        //cell.textLabel.frame = CGRectMake(0, 15, cell.frame.size.width, cell.frame.size.height / 2);
        //cell.textLabel.font=[UIFont fontWithName:@"Arial" size:10];
        //cell.textLabel.textAlignment = NSTextAlignmentLeft;
        //cell.textLabel.text = aLabel.text;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell addSubview:textLabel];
        [cell addSubview:textField];
        
        
        return cell;
    }
    return nil;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

