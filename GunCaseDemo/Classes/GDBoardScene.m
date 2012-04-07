//
//  GDBoardScene.m
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDBoardScene.h"

@implementation GDBoardScene

- (id)init
{
    self = [super init];
    
	if (self) {
        boardSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"board"]];
		tokenSprites[0] = nil;
		tokenSprites[1] = [GCSprite spriteWithImage: [NSImage imageNamed: @"x"]];
		tokenSprites[2] = [GCSprite spriteWithImage: [NSImage imageNamed: @"o"]];
		fieldSize = NSMakeSize(128, 128);

//		board[2] = TokenX;
//		board[7] = TokenO;
		for (NSInteger i = 0; i < 9; ++i) {
			board[i] = i % 2 + 1;
		}
		
		marker = [[GDMarker alloc] init];
    }
	
    return self;
}

static int foo = 0;

- (void) update
{
	if (++foo % 30 == 0) {
		int row = rand() % 3, col = rand() % 3;
		
		[marker placeAtRow: row column: col];
	}
	
	[marker update];
}

- (NSPoint) indexToPoint: (NSInteger) i
{
	// x:
	// 0 -> -1
	// 1 ->  0
	// 2 ->  1
	// y:
	// 0 ->  1
	// 1 ->  0
	// 2 -> -1
	
	NSInteger x = i % 3, y = i / 3;
	
	return NSMakePoint(
		(x - 1) * fieldSize.width,
		(1 - y) * fieldSize.height);
}

- (void) render
{
	[super render];	
	
	[boardSprite drawAtX: 0 y: 0];
	
	for (NSInteger i = 0; i < 9; ++i) {
		Token t = board[i];
		GCSprite *s = tokenSprites[t];
		NSPoint p = [self indexToPoint: i];
		
		[s drawAtX: p.x y: p.y];
	}
	
	[marker render];
}

@end
