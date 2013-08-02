//
//  AccountViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 7/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AccountViewController.h"
#import "GuestServiceConfirmationVC.h"

#import "SectionHeaderView.h"
#import "TableSection.h"

#import "AccountInformationView.h"

#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 45

@interface AccountViewController ()

@end

@implementation AccountViewController


@synthesize labelArray;
@synthesize label;
@synthesize tableView;

@synthesize maintenanceServices;
@synthesize maintenanceService;
@synthesize guestServices;
@synthesize guestService;

@synthesize sectionArray;
@synthesize openSectionIndex;





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    guestService = [[GuestService alloc] init];
    guestServices = [[NSMutableArray alloc] init];
    guestService.name = @"Account Information";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Itinerary";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Manage Guest Accounts";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];
    guestService = [[GuestService alloc] init];
    guestService.name = @"Account History";
    guestService.enabled = TRUE;
    [self setGuestService:guestService];
    [guestServices addObject:guestService];

    tableView.dataSource = self;
    tableView.delegate = self;
    
/*    self.sectionArray=[[NSMutableArray alloc]init];
    for (int i=0; i<=10; i++) {
        TableSection *section=[[TableSection alloc]init];
        // section.sectionHeader=[NSString stringWithFormat:@"Header %d",i];
        section.sectionRows=[[NSMutableArray alloc]init];
        for (int i=0; i<=10; i++) {
            [section.sectionRows addObject:[NSString stringWithFormat:@"Row %d",i]];
        }
        [self.sectionArray addObject:section];
    }
*/    
    
    self.sectionArray=[[NSMutableArray alloc]init];
    for (int i=0; i < guestServices.count; i++) {
        TableSection *section=[[TableSection alloc]init];
        guestService = [guestServices objectAtIndex:(i)];
        section.sectionHeader=guestService.name;
        section.sectionRows=[[NSMutableArray alloc]init];
        for (int j=0; j < 1; j++) {
            [section.sectionRows addObject:[[UIView alloc]init]];
        }
        [self.sectionArray addObject:section];
    }
    
    self.tableView.sectionHeaderHeight = HEADER_HEIGHT;
    self.openSectionIndex = NSNotFound;
    
     
}

#pragma mark - Table view data source
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    
    /*
     Create the section header views lazily.
     */
	TableSection *aSection=[sectionArray objectAtIndex:section];
    if (!aSection.sectionHeaderView) {
        aSection.sectionHeaderView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tableView.bounds.size.width, HEADER_HEIGHT) title:aSection.sectionHeader section:section delegate:self];
        
    }
    
    
    return aSection.sectionHeaderView;
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
    return [self.sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TableSection *aSection=[sectionArray objectAtIndex:section];
    // Return the number of rows in the section.
    return aSection.open ? [aSection.sectionRows count]:0;
}

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    
    TableSection *aSection=[sectionArray objectAtIndex:sectionOpened];
    aSection.open=YES;
    
    /*
     Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
     */
    NSInteger countOfRowsToInsert = [aSection.sectionRows count];
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }
    
    /*
     Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
     */
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
        TableSection *previousOpenSection=[sectionArray objectAtIndex:previousOpenSectionIndex];
        previousOpenSection.open=NO;
        [previousOpenSection.sectionHeaderView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
        
        
    }
    
    // Style the animation so that there's a smooth flow in either direction.
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // Apply the updates.
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.tableView endUpdates];
    self.openSectionIndex = sectionOpened;
    
    
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
    
	TableSection *aSection = [self.sectionArray objectAtIndex:sectionClosed];
	
    aSection.open = NO;
    
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCell"];
	//guestService = [self.guestServices objectAtIndex:indexPath.row];
	//cell.textLabel.text = guestService.name;
    //GuestService *service = [self.guestServices objectAtIndex:indexPath.row];
	//cell.textLabel.text = service.name;
    
    static NSString *MyIdentifier = @"accountNavigation";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //GuestService *service = [guestServices objectAtIndex:indexPath.row];
    
    /*
    UITextField *textLabel = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, cell.frame.size.width-10, cell.frame.size.height / 2)];
    textLabel.font=[UIFont fontWithName:@"Arial" size:12];
    textLabel.text=@"HELLO";
    [cell addSubview:textLabel];
     */
    AccountInformationView *aView = [[AccountInformationView alloc] init];
    [cell addSubview:aView];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}



@end

