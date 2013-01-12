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
        _drawingOffset = [GCVector zero];
    }
    return self;
}

#pragma mark -
#pragma mark Rendering the Thing

@synthesize sprite = _sprite, drawingOffset = _drawingOffset;

- (void) renderIndividually
{
    [_sprite drawAtX: self.drawingOffset.x
                   y: self.drawingOffset.y];
}

@end
