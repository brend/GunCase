//
//  GCAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCAnimation.h"

@interface GCAnimation ()
@property NSPoint beginning, end;
@property NSInteger stepCount, step;
@end

@implementation GCAnimation

@synthesize beginning = _beginning, end = _end, stepCount = _stepCount, step = _step;

#pragma mark -
#pragma mark Initialization and Deallocation

+ (id) linearAnimationFrom: (NSPoint) p
						to: (NSPoint) q
{
	GCAnimation *a = [[GCAnimation alloc] init];
	
	a.beginning = p;
	a.end = q;
	a.stepCount = 1000;
	a.step = 0;
	
	return a;
}

#pragma mark -
#pragma mark Application to a Movable Object

- (void) apply: (id<GCMovable>) target
{
	float length = (float) self.step / (float) self.stepCount;
	NSSize v = NSMakeSize(self.end.x - self.beginning.x, self.end.y - self.beginning.y);
	NSPoint p = NSMakePoint(self.beginning.x + v.width * length, self.beginning.y + v.height * length);
	
	target.position = p;
}

- (void) advance
{
	if (self.step < self.stepCount)
		++self.step;
}

@end
