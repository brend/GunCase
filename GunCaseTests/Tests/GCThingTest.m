//
//  GCThingTest.m
//  GunCase
//
//  Created by Philipp Brendel on 06.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GCThingTest.h"
#import "GCThing.h"

@implementation GCThingTest

- (void) testInit
{
	GCThing *t = [[GCThing alloc] init];
	
	STAssertNotNil(t.position, @"position mustn't be nil");
	STAssertTrue(NSEqualSizes(NSMakeSize(1, 1), t.scale), @"Scale must be 1x1");
	STAssertEquals(0.0f, t.rotation, @"Rotation must be 0");
}

@end
