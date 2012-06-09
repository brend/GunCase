//
//  GCVectorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 25.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
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
	
	v = [[GCVector alloc] initWithX: x y: y];
	
	STAssertEquals(x, v.x, @"x");
	STAssertEquals(y, v.y, @"y");
	
	v = [GCVector zero];
	
	STAssertEquals(0.0f, v.x, @"x");
	STAssertEquals(0.0f, v.y, @"y");
}

- (void) testLength
{
	float x = 17, y = 4;
	float length = sqrtf(x*x + y*y);
	GCVector *v = [GCVector vectorWithX: x y: y];
	
	STAssertEqualsWithAccuracy(length, v.length, 0.01, @"length");
}

- (void) testDistance
{
	float x1 = 3, y1 = 7, x2 = 2, y2 = -13;
	float dx = x2 - x1, dy = y2 - y1;
	float d = sqrt(dx * dx + dy * dy);
	
	GCVector *u = [GCVector vectorWithX: x1 y: y1], *v = [GCVector vectorWithX: x2 y: y2];
	
	STAssertEqualsWithAccuracy(d, [v distance: u], 0.01, @"distance");
}

- (void) testAdd
{
	float x1 = 3, y1 = 7, x2 = 2, y2 = -13;
	GCVector *u = [GCVector vectorWithX: x1 y: y1], *v = [GCVector vectorWithX: x2 y: y2];
	GCVector *w = [u add: v];

	STAssertEquals(x1 + x2, w.x, @"x");
	STAssertEquals(y1 + y2, w.y, @"y");
}

- (void) testSubtract
{
	float x1 = 3, y1 = 7, x2 = 2, y2 = -13;
	GCVector *u = [GCVector vectorWithX: x1 y: y1], *v = [GCVector vectorWithX: x2 y: y2];
	GCVector *w = [u subtract: v];
	
	STAssertEquals(x1 - x2, w.x, @"x");
	STAssertEquals(y1 - y2, w.y, @"y");
}

- (void) testDotProduct
{
	float x1 = 3, y1 = 7, x2 = 2, y2 = -13;
	float p = x1 * x2 + y1 * y2;
	GCVector *u = [GCVector vectorWithX: x1 y: y1], *v = [GCVector vectorWithX: x2 y: y2];
	
	STAssertEquals(p, [u dot: v], @"dot");
}

- (void) testAngle
{
	float x1 = 4, y1 = 0, x2 = 0, y2 = 4;
	float a = M_PI_2;
	GCVector *u = [GCVector vectorWithX: x1 y: y1], *v = [GCVector vectorWithX: x2 y: y2];
	
	STAssertEquals(a, [u angle: v], @"angle");
}

- (void) testIsEqual
{
	float x = 17.4, y = 21.0;
	GCVector 
		*v = [GCVector vectorWithX: x y: y], 
		*w = [GCVector vectorWithX: x y: y];
	
	STAssertEqualObjects(v, w, @"not equal");
}

@end
