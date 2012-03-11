//
//  GCStep.m
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLinearAnimation.h"
#import "GCGraphics.h"

@implementation GCLinearAnimation

- (id)initFrom: (GCVector *) p
			to: (GCVector *) q
	  duration: (double) seconds
{
    self = [super init];
    
	if (self) {
		double
			distance = [q distance: p],
			updateInterval = [[GCGraphics sharedGraphics] updateInterval];
		
		stepOffset = [[q subtract: p] scale: updateInterval * 1.0 / seconds];
		numberOfSteps = (NSInteger) ceil(distance / stepOffset.length);
    }
	
    return self;
}

+ (id) animationFrom: (GCVector *) p
			 to: (GCVector *) q
	 duration: (double) seconds
{
	return [[GCLinearAnimation alloc] initFrom: p to: q duration: seconds];
}

- (void) advance: (id<GCMovable>) target
{
	if (self.isFinished)
		return;
	
	GCVector *position = [stepOffset add: [GCVector vectorWithPoint: target.position]];
	
	target.position = [position point];
	
	++step;
}

- (BOOL) isFinished
{
	return step >= numberOfSteps;
}

- (void) rewind
{
	step = 0;
}

@end
