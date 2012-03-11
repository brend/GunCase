//
//  GCArcAnimation.m
//  GunCase
//
//  Created by Philipp Brendel on 10.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCArcAnimation.h"

@implementation GCArcAnimation

// TODO: Drehrichtung waehlbar machen
- (id) initWithCenter: (GCVector *) c
					radius: (float) r
				startAngle: (float) s
				  endAngle: (float) e
				  duration: (double) seconds
{
	self = [super initWithDuration: seconds];
	
	if (self) {		
		startAngle = s;
		radius = r;
		center = c;
		stepAngle = fabsf(e - s) / self.numberOfSteps;
	}
	
	return self;
}

+ (id) animationWithCenter: (GCVector *) c
					radius: (float) r
				startAngle: (float) s
				  endAngle: (float) e
				  duration: (double) seconds
{
	return [[GCArcAnimation alloc] initWithCenter: (GCVector *) c
										   radius: r
									   startAngle: s
										 endAngle: e
										 duration: seconds];
}

- (void) advanceStep:(id<GCMovable>)target
{
	float angle = startAngle + self.currentStep * stepAngle;
	float x = center.x + radius * cosf(angle);
	float y = center.y + radius * sinf(angle);
	
	target.position = NSMakePoint(x, y);
}

@end
