//
//  GCStep.m
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLinearAnimation.h"

@interface GCLinearAnimation ()
@property (nonatomic, strong) GCVector *startLocation;
@end

@implementation GCLinearAnimation

- (id)initFrom: (GCVector *) p
			to: (GCVector *) q
	  duration: (double) seconds
{
    self = [super initWithDuration: seconds];
    
	if (self) {
		stepOffset = [[q subtract: p] scale: 1.0 / self.numberOfSteps];
		self.startLocation = p;
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
	
	// At the very first step of the animation,
	// the target is placed at the animation's starting point
	if (!animationHasBegun) {
		target.position = self.startLocation;
		animationHasBegun = YES;
	}
	
	GCVector *position = [stepOffset add: target.position];
	
	target.position = position;
}

- (void) rewind
{
	[super rewind];
	animationHasBegun = NO;
}

@end
