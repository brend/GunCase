//
//  GCStack.m
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCStack.h"

@implementation GCStack

- (id)init
{
    self = [super init];
    if (self) {
        items = [NSMutableArray array];
    }
    return self;
}

- (void) push: (id) anObject
{
	[items addObject: anObject];
}

- (id) peek
{
	return items.count == 0 ? nil : [items objectAtIndex: items.count - 1];
}

- (id) pop
{
	NSInteger c = items.count;
	
	if (c == 0)
		return nil;
	
	id i = [items objectAtIndex: c - 1];
	
	[items removeObjectAtIndex: c - 1];
	
	return i;
}

- (BOOL) empty
{
	return items.count == 0;
}

- (NSArray *) allObjects
{
	return items;
}

@end
