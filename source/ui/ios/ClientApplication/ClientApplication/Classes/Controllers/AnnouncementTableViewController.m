//
//  AnnouncementTableViewController.m
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AnnouncementTableViewController.h"
#import "SectionHeaderView.h"
#import "TableSection.h"

#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 45


@implementation AnnouncementTableViewController

@synthesize announcementArray;
@synthesize aAnnouncement;
@synthesize guestServiceName;
@synthesize sectionArray;
@synthesize openSectionIndex;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    aAnnouncement = [[Announcement alloc] init];
    announcementArray = [[NSMutableArray alloc] init];
    aAnnouncement.header = @"News";
    aAnnouncement.body = @"THIS IS A FUCKING TEST";
    [self setAAnnouncement:aAnnouncement];
    [announcementArray addObject:aAnnouncement];
    aAnnouncement = [[Announcement alloc] init];
    aAnnouncement.header = @"Indulge";
    aAnnouncement.body = @"Get Money";
    [self setAAnnouncement:aAnnouncement];
    [announcementArray addObject:aAnnouncement];
    aAnnouncement = [[Announcement alloc] init];
    aAnnouncement.header = @"Follow Us";
    aAnnouncement.body = @"Fuck Bitches";
    [self setAAnnouncement:aAnnouncement];
    [announcementArray addObject:aAnnouncement];
    
    self.sectionArray=[[NSMutableArray alloc]init];
    for (int i=0; i<=10; i++) {
        TableSection *section=[[TableSection alloc]init];
       // section.sectionHeader=[NSString stringWithFormat:@"Header %d",i];
        section.sectionRows=[[NSMutableArray alloc]init];
        for (int i=0; i<=10; i++) {
            [section.sectionRows addObject:[NSString stringWithFormat:@"Row %d",i]];
        }
        [self.sectionArray addObject:section];
    }
    
    
    self.sectionArray=[[NSMutableArray alloc]init];
    Announcement *anAnnouncement;
    for (int i=0; i < announcementArray.count; i++) {
        TableSection *section=[[TableSection alloc]init];
        anAnnouncement = [announcementArray objectAtIndex:(i)];
        section.sectionHeader=anAnnouncement.header;
        section.sectionRows=[[NSMutableArray alloc]init];
        for (int j=0; j < 1; j++) {
            [section.sectionRows addObject:[anAnnouncement body]];
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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableSection *aSection=[sectionArray objectAtIndex:indexPath.section];
    static NSString *CellIdentifier = @"guestCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text=[aSection.sectionRows objectAtIndex:indexPath.row];
    return cell;
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
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
