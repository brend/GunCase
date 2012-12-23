//
//  GCSpriteThing.m
//  GunCase
//
//  Created by Philipp Brendel on 14.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCSpriteActor.h"

@implementation GCSpriteActor

- (id)initWithSprite: (GCSprite *) sprite
{
    self = [super init];
    if (self) {
        _sprite = sprite;
    }
    return self;
}

#pragma mark -
#pragma mark Rendering the Thing
- (void) render
{
	[_sprite drawAtX: self.position.x + self.drawingOffset.x
                   y: self.position.y + self.drawingOffset.y
            rotation: self.rotation
               scale: self.scale];
}

@synthesize sprite = _sprite, drawingOffset = _drawingOffset;

@end
