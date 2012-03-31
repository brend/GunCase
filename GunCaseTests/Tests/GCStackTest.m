//
//  GCStackTest.m
//  GunCase
//
//  Created by Philipp Brendel on 31.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCStackTest.h"
#import "GCStack.h"

@implementation GCStackTest

- (void) testInit
{
	GCStack *stack = [[GCStack alloc] init];
	
	STAssertNotNil(stack, @"Stack is nil");
	STAssertTrue(stack.empty, @"Stack is not empty");
//	STAssertEquals((NSUInteger)0, stack.count, @"Stack has elements");
	STAssertNil([stack peek], @"Peek should return nil");
}

- (void) testPush
{
	GCStack *stack = [[GCStack alloc] init];
	
	[stack push: @"x"];
	
	STAssertFalse(stack.empty, @"Stack is empty");
//	STAssertEquals((NSUInteger)1, stack.count, @"Stack has wrong height");
	STAssertEqualObjects(@"x", [stack peek], @"Peek returns wrong element");
}

- (void) testPop
{
	GCStack *stack = [[GCStack alloc] init];
	
	[stack pop];
	[stack push: @"x"];
	[stack push: @"y"];
	
	id y = [stack pop];
	
	STAssertEqualObjects(y, @"y", @"Pop returned wrong element");
	
	id x = [stack pop];

	STAssertEqualObjects(x, @"x", @"Pop returned wrong element");
}

- (void) testEmpty
{
	GCStack *stack = [[GCStack alloc] init];
	
	STAssertTrue(stack.empty, @"Stack should be empty");
	
	[stack push: @"x"];
	
	STAssertFalse(stack.empty, @"Stack should not be empty");
	
	[stack push: @"y"];
	
	STAssertFalse(stack.empty, @"Stack should not be empty");

	[stack pop];
	
	STAssertFalse(stack.empty, @"Stack should not be empty");

	[stack pop];
	
	STAssertTrue(stack.empty, @"Stack should be empty");
}

@end
