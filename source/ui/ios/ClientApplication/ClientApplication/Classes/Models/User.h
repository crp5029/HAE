//
//  User.h
//  ClientApplication
//
//  Created by Chris Purtell on 1/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *isAdmin;

@end
