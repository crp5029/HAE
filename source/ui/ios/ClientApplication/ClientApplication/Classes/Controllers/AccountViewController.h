//
//  AccountViewController.h
//  ClientApplication
//
//  Created by Chris Purtell on 7/19/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandardTableButton.h"

@interface AccountViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic) int *x;
@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) StandardTableButton *aButton;
@property (strong, nonatomic) IBOutlet UIScrollView *uiScrollView;

@end
