//
//  AccountInformationView.m
//  ClientApplication
//
//  Created by Chris Purtell on 8/2/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "AccountInformationView.h"

@implementation AccountInformationView

@synthesize valueLabel;
@synthesize textLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(5, 0, 322, 10);
        textLabel = [[UITextField alloc] initWithFrame:CGRectMake(6, 0, 100, 20)];
        valueLabel = [[UITextField alloc] initWithFrame:CGRectMake(200, 0, 100, 20)];
        textLabel.font=[UIFont fontWithName:@"Arial" size:12];
        textLabel.text=@"Current Balance: ";
        valueLabel.font=[UIFont fontWithName:@"Arial" size:12];
        valueLabel.text=@"$100.00";
    
        [self addSubview:textLabel];
        [self addSubview:valueLabel];

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
