//
//  GCStep.m
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCStep.h"
#import "GCGraphics.h"

@implementation GCStep

- (id)initFrom: (GCVector *) p
			to: (GCVector *) q
	  duration: (double) seconds
{
    self = [super init];
    
	if (self) {
		double
			distance = [q distance: p],
			updateInterval = [[GCGraphics sharedGraphics] updateInterval];
		
		stepOffset = [[q subtract: p] scale: seconds * updateInterval];
		numberOfSteps = (NSInteger) (distance / (seconds * updateInterval));
    }
	
    return self;
}

+ (id) lineFrom: (GCVector *) p
			 to: (GCVector *) q
	 duration: (double) seconds
{
	return [[GCStep alloc] initFrom: p to: q duration: seconds];
}

- (void) advance: (id<GCMovable>) target
{
	if (self.finished)
		return;
	
	GCVector *position = [stepOffset add: [GCVector vectorWithPoint: target.position]];
	
	target.position = [position point];
	
	++step;
}

- (BOOL) finished
{
	return step >= numberOfSteps;
}

- (void) rewind
{
	step = 0;
}

@end
