//
//  AccountInformationView.m
//  ClientApplication
//
//  Created by Chris Purtell on 8/2/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AccountInformationView.h"

@implementation AccountInformationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        frame = CGRectMake(5, 0, 322, 320);
        UITextField *textLabel = [[UITextField alloc] initWithFrame:CGRectMake(6, 0, 100, 100)];
        textLabel.font=[UIFont fontWithName:@"Arial" size:12];
        textLabel.text=@"TEST";
        [self addSubview:textLabel];

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
