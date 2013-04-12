//
//  KBKeyboardHandler.h
//  ClientApplication
//
//  Created by Chris Purtell on 4/12/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KBKeyboardHandlerDelegate;

@interface KBKeyboardHandler : NSObject

- (id)init;

// Put 'weak' instead of 'assign' if you use ARC
@property(nonatomic, weak) id<KBKeyboardHandlerDelegate> delegate;
@property(nonatomic) CGRect frame;

@end
