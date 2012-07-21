//
//  GDBoardScene.m
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDBoardScene.h"
#import "GDBackgroundLayer.h"
#import "GDTokensLayer.h"

@interface GDBoardScene	()
@property (nonatomic, strong) GCFont *font;
@end

@implementation GDBoardScene

- (id)init
{
    self = [super init];
    
	if (self) {
		currentPlayerLabelSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"CurrentPlayerLabel"]];
		winnerLabelSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"WinnerLabel"]];
		
		NSImage *fontImage = [NSImage imageNamed: @"font"];
		self.font = [[GCFont alloc] initWithImage: fontImage columns: 16 rows: 16];
		
		fieldSize = NSMakeSize(128, 128);

		marker = [[GDMarker alloc] init];
		[marker placeAtRow: 0 column: 0];

		currentToken = [GDToken tokenX];
		
		board = [NSMutableArray array];
		for (NSInteger i = 0; i < 9; ++i) {
			[board addObject: [GDToken tokenNone]];
		}
		
		[self addLayer: [[GDBackgroundLayer alloc] init]];
		[self addLayer: [[GDTokensLayer alloc] initWithBoard: board]];
    }
	
    return self;
}

@synthesize font;

- (void) update
{
	[super update];
	
    [self processUserInput];
	[marker update];
}

- (GDToken *) tokenAtIndex: (NSUInteger) index
{
	return [board objectAtIndex: index];
}

- (void) setToken: (GDToken *) token atIndex: (NSUInteger) index
{
	[board replaceObjectAtIndex: index withObject: token];
}

- (void) placeToken
{
	if (![[self winner] isNone])
		return;
	
	NSInteger row = marker.row, col = marker.col;
	NSInteger index = row * 3 + col;
	
	if ([[self tokenAtIndex: index] isNone]) {	
		[self setToken: currentToken atIndex: index];
		currentToken = [currentToken theOtherOne];
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
		
	GDToken *winner = [self winner];

	// Draw the marker
	if ([winner isNone])
		[marker render];
	
	// Draw current player info or winner's token
	GCSprite *labelSprite = 
		[winner isNone]
			? currentPlayerLabelSprite
			: winnerLabelSprite;
	// TODO: Prettify
	GCSprite *currentTokenSprite = 
		[winner isNone]
			? currentToken.sprite
			: [[currentToken theOtherOne] sprite];
	
	[labelSprite drawAtX: -400 + currentPlayerLabelSprite.width / 2 y: 300 - currentPlayerLabelSprite.height / 2];		
	[currentTokenSprite drawAtX: -400 + currentPlayerLabelSprite.width + currentPlayerLabelSprite.width / 2
								  y: 300 - currentPlayerLabelSprite.height / 2
						   rotation: 0 
							  scale: NSMakeSize(0.5, 0.5)];
	
	[font drawString: @";-)" atPosition: [GCVector vectorWithX: -380 y: -290]];
}

#pragma mark -
#pragma mark Handling User Input
- (void) processUserInput
{
    for (NSNumber *n in self.keyboard.pressedKeys) {
        ushort keyCode = n.unsignedShortValue;
        
        switch (keyCode) {
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
                if (![[self winner] isNone])
                    NSLog(@"Winner: %@", [self winner]);
                break;
            case 15:
                [self resetBoard];
            default:
                break;
        }
        
        [self.keyboard clearKey: keyCode];
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

- (GDToken *) winner
{
	// Check rows and cols
	for (NSInteger i = 0; i < 3; ++i) {
		GDToken
			*rowWinner = [GDToken tokenNone],
			*colWinner = [GDToken tokenNone];
		
		for (NSInteger j = 0; j < 3; ++j) {
			if (j == 0) {
				rowWinner = [self tokenAtIndex: i * 3];
				colWinner = [self tokenAtIndex: i];
			} else {
				if ([self tokenAtIndex: i * 3 + j] != rowWinner)
					rowWinner = [GDToken tokenNone];
				
				if ([self tokenAtIndex: j * 3 + i] != colWinner)
					colWinner = [GDToken tokenNone];
			}
		}
		
		if (![rowWinner isNone])
			return rowWinner;
		if (![colWinner isNone])
			return colWinner;
	}
	
	// Check diagonals
	GDToken *d1 = [GDToken tokenNone], *d2 = [GDToken tokenNone];
	for (NSInteger i = 0; i < 3; ++i) {
		if (i == 0) {
			d1 = [self tokenAtIndex: i * 3 + i];
			d2 = [self tokenAtIndex: i * 3 + (3 - (i + 1))];
		} else {
			if ([self tokenAtIndex: i * 3 + i] != d1)
				d1 = [GDToken tokenNone];
			if ([self tokenAtIndex: i * 3 + (3 - (i + 1))] != d2)
				d2 = [GDToken tokenNone];
		}
	}
	
	if (![d1 isNone])
		return d1;
	if (![d2 isNone])
		return d2;
	
	return [GDToken tokenNone];
}

- (void) resetBoard
{
	for (NSInteger i = 0; i < 9; ++i)
		[self setToken: [GDToken tokenNone] atIndex: i];
	
	currentToken = [GDToken tokenX];
}

@end
