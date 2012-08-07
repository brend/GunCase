//
//  GCCompositeAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCSequentialAnimation.h"
#import "GCLinearAnimation.h"
#import "GCArcAnimation.h"

@interface GCSequentialAnimation ()
@property NSPoint beginning, end;
@property NSInteger stepCount, step;
@end

@implementation GCSequentialAnimation

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

- (id) lineFrom: (GCVector *) p
			   To: (GCVector *) q
		 duration: (double) seconds
{
	GCLinearAnimation *step = [GCLinearAnimation animationFrom: p to: q duration: seconds];
	
	[steps addObject: step];
	
	return self;
}

- (id) arcWithCenter: (GCVector *) c
			  radius: (float) r
		  startAngle: (float) s
			endAngle: (float) e
			duration: (double) seconds
{
	GCArcAnimation *step = [GCArcAnimation animationWithCenter: c
														radius: r
													startAngle: s
													  endAngle: e
													  duration: seconds];
	
	[steps addObject: step];
	
	return self;
}

- (void) advance: (id<GCMovable>) target;
{
	if (self.isFinished)
		return;
	
	GCLinearAnimation *s = [steps objectAtIndex: currentStep];
	
	[s advance: target];
	
	if (s.isFinished)
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
	for (GCLinearAnimation *step in steps) {
		[step rewind];
	}
}

@end
