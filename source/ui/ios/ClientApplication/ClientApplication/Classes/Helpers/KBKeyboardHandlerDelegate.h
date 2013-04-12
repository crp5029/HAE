//
//  KBKeyboardHandlerDelegate.h
//  ClientApplication
//
//  Created by Chris Purtell on 4/12/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KBKeyboardHandlerDelegate

//- (void)keyboardSizeChanged:(CGSize)delta;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
