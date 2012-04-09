//
//  GDTokensLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDTokensLayer.h"

@implementation GDTokensLayer

- (id)initWithBoard:(NSArray *)b
{
    self = [super init];
    if (self) {
        board = b;
    }
	
    return self;
}

- (GDToken *) tokenAtIndex: (NSUInteger) index
{
	return [board objectAtIndex: index];
}

- (void) render
{
	[super render];
	
	// Draw the tokens
	for (NSInteger i = 0; i < 9; ++i) {
		GDToken *t = [self tokenAtIndex: i];
		
		[t drawAtRow: i / 3 col: i % 3];
	}
}

@end
