//
//  GDMarker.m
//  GunCase
//
//  Created by Philipp Brendel on 07.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDMarker.h"

@implementation GDMarker

@synthesize row, col;

- (id)init
{
    self = [super init];
    if (self) {
		NSImage *image = [NSImage imageNamed: @"marker"];
		
        sprite = [GCSprite spriteWithImage: image];
    }
    return self;
}

- (void) placeAtRow: (NSInteger) r column: (NSInteger) c
{
	if (r >= 0 && r < 3)
		row = r;
	if (c >= 0 && c < 3)
		col = c;
	
	float y = (1 - row) * 128, x = (col - 1) * 128;
	GCVector *there = [GCVector vectorWithX: x y: y];
	
	animation = [GCLinearAnimation animationFrom: self.position to: there duration: 0.5];
}

- (void) update
{
	[animation advance: self];
}

- (void) render
{
	[sprite drawAtX: self.position.x y: self.position.y];
}


- (void) moveLeft
{
	[self placeAtRow: row column: col - 1];
}

- (void) moveRight
{
	[self placeAtRow: row column: col + 1];
}

- (void) moveUp
{
	[self placeAtRow: row - 1 column: col];
}

- (void) moveDown
{
	[self placeAtRow: row + 1 column: col];
}

@end
