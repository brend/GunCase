//
//  GCTimedAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 11.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCTimedAnimation.h"
#import "GCGraphics.h"

@implementation GCTimedAnimation

- (id) init
{
	// To avoid unpleasantness,
	// initialize with 1 second by default
	return [self initWithDuration: 1.0];
}

- (id) initWithDuration: (double) seconds
{
	self = [super init];
	
	if (self) {
		double updateInterval = 
			[[GCGraphics sharedGraphics] updateInterval];
		
		_numberOfSteps = seconds / updateInterval;
		_currentStep = 0;
	}
	
	return self;
}

@synthesize numberOfSteps = _numberOfSteps, currentStep = _currentStep;

- (BOOL) isFinished
{
	return _currentStep >= _numberOfSteps;
}

- (void) rewind
{
	_currentStep = 0;
}

- (void) advance:(id<GCMovable>)target
{
	[self advanceStep: target];
	
	++_currentStep;
}

- (void) advanceStep:(id<GCMovable>)target
{
	@throw [NSException exceptionWithName: @"AbstractMethod" reason: @"This method must be implemented by a subclass" userInfo: nil];
}

@end
