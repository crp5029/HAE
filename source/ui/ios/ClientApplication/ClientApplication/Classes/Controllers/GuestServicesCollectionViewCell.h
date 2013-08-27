//
//  GuestServicesCollectionViewCell.h
//  ClientApplication
//
//  Created by Chris Purtell on 8/27/13.
//  Copyright (c) 2013 Chris Purtell. All rights reserved.
//

#import "CBetterCollectionViewCell.h"

@class CReflectionView;

@interface GuestServicesCollectionViewCell : CBetterCollectionViewCell
@property (readwrite, nonatomic, weak) IBOutlet UIImageView *imageView;
@property (readwrite, nonatomic, weak) IBOutlet CReflectionView *reflectionImageView;
@end