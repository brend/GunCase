//
//  GCAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCAnimation.h"
#import "GCStep.h"

@interface GCAnimation ()
@property NSPoint beginning, end;
@property NSInteger stepCount, step;
@end

@implementation GCAnimation

@synthesize beginning = _beginning, end = _end, stepCount = _stepCount, step = _step;

#pragma mark -
#pragma mark Initialization and Deallocation

- (id)init
{
    self = [super init];
    if (self) {
		steps = [NSMutableArray array];
    }
    return self;
}

+ (id) animation
{
	return [[self alloc] init];
}

- (void)dealloc 
{
	steps = nil;
}

- (void) lineFrom: (GCVector *) p
			   To: (GCVector *) q
		 duration: (double) seconds
{
	GCStep *step = [GCStep lineFrom: p to: q duration: seconds];
	
	[steps addObject: step];
}

- (void) advance: (id<GCMovable>) target;
{
	if (self.isFinished)
		return;
	
	GCStep *s = [steps objectAtIndex: currentStep];
	
	[s advance: target];
	
	if (s.finished)
		++currentStep;
}

- (BOOL) isFinished
{
	return currentStep >= steps.count;
}

#pragma mark -
#pragma mark Application to a Movable Object

- (void) apply: (id<GCMovable>) target
{
	@throw [NSException exceptionWithName: @"NotImplemented" reason: @"Laziness" userInfo: nil];
}

- (void) advance
{
	if (self.step < self.stepCount)
		++self.step;
}

- (void) rewind
{
	currentStep = 0;
	for (GCStep *step in steps) {
		[step rewind];
	}
}

@end
