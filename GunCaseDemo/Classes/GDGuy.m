//
//  GDGuy.m
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDGuy.h"

@implementation GDGuy
@synthesize position = _position, rotation = _rotation, scale = _scale, sprite = _sprite, animation = _animation;

- (id)init {
    self = [super init];
    if (self) {
        self.sprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"walker"]];
		self.animation = [GCAnimation linearAnimationFrom: NSMakePoint(-200, -200) to: NSMakePoint(500, 500)];
		self.scale = NSMakeSize(1, 1);
    }
    return self;
}

- (void) draw
{	
	//[self.animation apply: self];
	// [self.sprite drawAtX: self.position.x y: self.position.y rotation: self.rotation scale: self.scale];
	[self.sprite drawTest];
	
	//[self.animation advance];
}

- (void) flip
{
	self.sprite.flip = 1 - self.sprite.flip;
}

@end
