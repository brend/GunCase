//
//  GCDirectorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 09.06.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCDirectorTest.h"

@implementation GCDirectorTest

- (void) testInstances
{
	GCDirector 
		*d = [GCDirector sharedDirector],
		*e = [GCDirector sharedDirector];
	
	STAssertFalse(d == e, @"Same instance");
}

@end
