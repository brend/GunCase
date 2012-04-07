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

- (void) update
{
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

#pragma mark -
#pragma mark Handling User Input
- (void)keyDown:(NSEvent *)theEvent
{
	[theEvent characters];
	
	switch (theEvent.keyCode) {
		case 123:
			[marker moveLeft];
			break;
		case 124:
			[marker moveRight];
			break;
		case 126:
			[marker moveUp];
			break;
		case 125:
			[marker moveDown];
			break;
		default:
			break;
	}
}

- (void) mouseDown:(NSEvent *)theEvent
{
	// 1->0, 0->1, -1->2
	// 480, 348
	NSPoint p = [theEvent locationInWindow];
	
	p.x = p.x + 64 - theEvent.window.frame.size.width / 2;
	p.y = p.y - 64 - theEvent.window.frame.size.height / 2;
	
	NSLog(@"mouse %f, %f", p.x, p.y);
	
	NSInteger
		col = floor(p.x / 128 + 1),
		row = floor(1 - p.y / 128);
	
	[marker placeAtRow: row column: col];
}

@end
