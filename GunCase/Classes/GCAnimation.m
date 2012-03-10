//
//  GCAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 10.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCAnimation.h"

@implementation GCAnimation

- (void) advance: (id<GCMovable>) target
{
	@throw [NSException exceptionWithName: @"AbstractMethod" reason: @"This method must be implemented in a subclass" userInfo: nil];
}

- (BOOL) isFinished
{
	@throw [NSException exceptionWithName: @"AbstractMethod" reason: @"This method must be implemented in a subclass" userInfo: nil];
}

- (void) rewind
{
	@throw [NSException exceptionWithName: @"AbstractMethod" reason: @"This method must be implemented in a subclass" userInfo: nil];
}

@end
