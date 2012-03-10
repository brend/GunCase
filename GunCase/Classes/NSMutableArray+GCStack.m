//
//  NSMutableArray+GCStack.m
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "NSMutableArray+GCStack.h"

@implementation NSMutableArray (GCStack)

- (void) push: (id) anObject
{
	[self addObject: anObject];
}

- (id) pop
{
	NSInteger i = self.count - 1;
	
	if (i == 0)
		return nil;
	
	id anObject = [self objectAtIndex: i];
	
	[self removeObjectAtIndex: i];
	
	return anObject;
}

@end
