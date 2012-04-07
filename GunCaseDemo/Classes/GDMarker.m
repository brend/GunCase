//
//  GDMarker.m
//  GunCase
//
//  Created by Philipp Brendel on 07.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GDMarker.h"

@implementation GDMarker

@synthesize position = _position, rotation = _rotation, scale = _scale;

- (id)init
{
    self = [super init];
    if (self) {
		NSImage *image = [NSImage imageNamed: @"marker"];
		
        sprite = [GCSprite spriteWithImage: image];
    }
    return self;
}

- (void) placeAtRow: (NSInteger) row column: (NSInteger) col
{
	float y = (1 - row) * 128, x = (col - 1) * 128;
	GCVector *here = [GCVector vectorWithPoint: _position], *there = [GCVector vectorWithX: x y: y];
	
	animation = [GCLinearAnimation animationFrom: here to: there duration: 0.5];
}

- (void) update
{
	[animation advance: self];
}

- (void) render
{
	[sprite drawAtX: _position.x y: _position.y];
}

@end
