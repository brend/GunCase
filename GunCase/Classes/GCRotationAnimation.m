//
//  GCRotationAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 08.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCRotationAnimation.h"

@implementation GCRotationAnimation

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void) advance: (id<GCMovable>) target
{
	angle += M_PI / 15;
	
	target.rotation = angle;
}

- (BOOL) isFinished
{
	return NO;
}

- (void) rewind
{
	angle = 0;
}

@end
