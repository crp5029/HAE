//
//  AnnouncementTableViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Announcement.h"
#import "SectionHeaderView.h"


@interface AnnouncementTableViewController : UITableViewController<SectionHeaderViewDelegate> {
    
}

@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, assign) NSInteger openSectionIndex;
@property (nonatomic, strong) NSMutableArray *announcementArray;
@property (nonatomic, strong) NSString *guestServiceName;
@property (nonatomic, strong) Announcement *aAnnouncement;

//- (IBAction)backButton:(id)sender;




@end
