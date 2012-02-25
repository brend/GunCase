//
//  GCVectorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 25.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GCVectorTest.h"

@implementation GCVectorTest

- (void) setUp
{
}

- (void) tearDown
{
	
}

- (void) testInit
{
	float x = 17, y = 4;
	GCVector *v = [GCVector vectorWithX: x y: y];
	
	STAssertEquals(x, v.x, @"x");
	STAssertEquals(y, v.y, @"y");
}

- (void) testLength
{
	float x = 17, y = 4;
	float length = sqrtf(x*x + y*y);
	GCVector *v = [GCVector vectorWithX: x y: y];
	
	STAssertEqualsWithAccuracy(length, v.length, 0.01, @"length");
}

@end
