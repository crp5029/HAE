//
//  User.h
//  ClientApplication
//
//  Created by Chris Purtell on 1/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *tableId;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *streetName;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;


@end
