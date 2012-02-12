//
//  GCAnimationTest.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCAnimationTest.h"

@implementation GCAnimationTest

- (void)setUp
{
    [super setUp];
	
	++ i;
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testOne
{
    STFail(@"i = %d", i);
}

- (void)testTwo
{
	STFail(@"i = %d", i);
}

@end
