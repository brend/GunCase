//
//  GDGuy.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDGuy.h"

#define rand	((float) rand() / RAND_MAX)

@implementation GDGuy
@synthesize position = _position, rotation = _rotation, scale = _scale, sprite = _sprite, animation = _animation;

- (id)init {
    self = [super init];
    if (self) {
        self.sprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"walker"]];
		self.scale = NSMakeSize(1, 1);
		
		self.animation = [GCAnimation animation];
		
		GCVector
			*a = [GCVector vectorWithX: 0 y: 0],
			*b = [GCVector vectorWithX: 50 y: 0],
			*c = [GCVector vectorWithX: 50 y: -50],
			*d = [GCVector vectorWithX: 0 y: -50];
		
		[self.animation lineFrom: a To: b duration: 2];
		[self.animation lineFrom: b To: c duration: 1.5];
		[self.animation lineFrom: c To: d duration: 1];
		[self.animation lineFrom: d To: a duration: 0.5];
    }
    return self;
}

- (void) draw
{	
	[self.sprite drawAtX: self.position.x y: self.position.y rotation: self.rotation scale: self.scale];
}

- (void) flip
{
	self.sprite.flip = 1 - self.sprite.flip;
}

- (void) update
{
	[self.animation advance: self];
}

- (void) reset
{
	[self.animation rewind];
}

@end
