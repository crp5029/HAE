//
//  AccountInformationView.h
//  ClientApplication
//
//  Created by Chris Purtell on 8/2/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountInformationView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textLabel;
@property (nonatomic, strong) UITextField *valueLabel;

@end
