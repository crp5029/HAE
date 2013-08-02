//
//  Announcement.h
//  ClientApplication
//
//  Created by Chris Purtell on 5/8/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Announcement : NSObject

@property (nonatomic, strong) NSString *tableId;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSString *body;

//variable to add extra functionaly; "Book now with this deal!"
//@property (nonatomic, strong) NSString *body;

@end
