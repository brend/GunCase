//
//  GCStep.m
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLinearAnimation.h"

@implementation GCLinearAnimation

- (id)initFrom: (GCVector *) p
			to: (GCVector *) q
	  duration: (double) seconds
{
    self = [super initWithDuration: seconds];
    
	if (self) {
		stepOffset = [[q subtract: p] scale: 1.0 / self.numberOfSteps];
    }
	
    return self;
}

+ (id) animationFrom: (GCVector *) p
			 to: (GCVector *) q
	 duration: (double) seconds
{
	return [[GCLinearAnimation alloc] initFrom: p to: q duration: seconds];
}

- (void) advanceStep:(id<GCMovable>)target
{
	if (self.isFinished)
		return;
	
	GCVector *position = [stepOffset add: [GCVector vectorWithPoint: target.position]];
	
	target.position = [position point];
}

@end