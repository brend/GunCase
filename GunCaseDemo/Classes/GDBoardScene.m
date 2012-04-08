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
		currentPlayerLabelSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"CurrentPlayerLabel"]];
		winnerLabelSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"WinnerLabel"]];
		tokenSprites[0] = nil;
		tokenSprites[1] = [GCSprite spriteWithImage: [NSImage imageNamed: @"x"]];
		tokenSprites[2] = [GCSprite spriteWithImage: [NSImage imageNamed: @"o"]];
		fieldSize = NSMakeSize(128, 128);

		marker = [[GDMarker alloc] init];
		[marker placeAtRow: 0 column: 0];
		currentToken = TokenX;
    }
	
    return self;
}

- (void) update
{
	[marker update];
}

- (void) placeToken
{
	if ([self winner] != TokenNone)
		return;
	
	NSInteger row = marker.row, col = marker.col;
	NSInteger index = row * 3 + col;
	
	if (board[index] == TokenNone) {	
		board[index] = currentToken;
		currentToken = currentToken == TokenX ? TokenO : TokenX;
	} else {
		// TODO: Display message?
	}
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
	
	Token winner = [self winner];

	// Draw the board and tokens
	[boardSprite drawAtX: 0 y: 0];
	
	for (NSInteger i = 0; i < 9; ++i) {
		Token t = board[i];
		GCSprite *s = tokenSprites[t];
		NSPoint p = [self indexToPoint: i];
		
		[s drawAtX: p.x y: p.y];
	}
	
	// Draw the marker
	if (winner == TokenNone)
		[marker render];
	
	// Draw current player info or winner's token
	GCSprite *labelSprite = 
		winner == TokenNone
			? currentPlayerLabelSprite
			: winnerLabelSprite;
	GCSprite *currentTokenSprite = 
		winner == TokenNone
			? tokenSprites[currentToken]
			: tokenSprites[currentToken == TokenX ? TokenO : TokenX];
	
	[labelSprite drawAtX: -400 + currentPlayerLabelSprite.width / 2 y: 300 - currentPlayerLabelSprite.height / 2];		
	[currentTokenSprite drawAtX: -400 + currentPlayerLabelSprite.width + currentPlayerLabelSprite.width / 2
								  y: 300 - currentPlayerLabelSprite.height / 2
						   rotation: 0 
							  scale: NSMakeSize(0.5, 0.5)];
}

#pragma mark -
#pragma mark Handling User Input
- (void)keyDown:(NSEvent *)theEvent
{
	[theEvent characters];
	
	// NSLog(@"key %d", theEvent.keyCode);
	
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
		case 36:
		case 49:
			[self placeToken];
			if ([self winner] != TokenNone)
				NSLog(@"Winner: %d", [self winner]);
			break;
		case 15:
			[self resetBoard];
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
	
	// NSLog(@"mouse %f, %f", p.x, p.y);
	
	NSInteger
		col = floor(p.x / 128 + 1),
		row = floor(1 - p.y / 128);
	
	[marker placeAtRow: row column: col];
	[self placeToken];
}

- (Token) winner
{
	// Check rows and cols
	for (NSInteger i = 0; i < 3; ++i) {
		Token rowWinner = TokenNone, colWinner = TokenNone;
		
		for (NSInteger j = 0; j < 3; ++j) {
			if (j == 0) {
				rowWinner = board[i * 3];
				colWinner = board[i];
			} else {
				if (board[i * 3 + j] != rowWinner)
					rowWinner = TokenNone;
				
				if (board[j * 3 + i] != colWinner)
					colWinner = TokenNone;
			}
		}
		
		if (rowWinner != TokenNone)
			return rowWinner;
		if (colWinner != TokenNone)
			return colWinner;
	}
	
	// Check diagonals
	Token d1 = TokenNone, d2 = TokenNone;
	for (NSInteger i = 0; i < 3; ++i) {
		if (i == 0) {
			d1 = board[i * 3 + i];
			d2 = board[i * 3 + (3 - (i + 1))];
		} else {
			if (board[i * 3 + i] != d1)
				d1 = TokenNone;
			if (board[i * 3 + (3 - (i + 1))] != d2)
				d2 = TokenNone;
		}
	}
	
	if (d1 != TokenNone)
		return d1;
	if (d2 != TokenNone)
		return d2;
	
	return TokenNone;
}

- (void) resetBoard
{
	for (NSInteger i = 0; i < 9; ++i)
		board[i] = TokenNone;
	currentToken = TokenX;
}

@end
