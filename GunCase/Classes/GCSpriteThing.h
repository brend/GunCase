//
//  GCSpriteThing.h
//  GunCase
//
//  Created by Philipp Brendel on 14.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCThing.h"
#import "GCSprite.h"

@interface GCSpriteThing : GCThing <GCMovable, GCRenderable>
{
	GCSprite *_sprite;
}

#pragma mark -
#pragma mark Initialization
- (id) initWithSprite: (GCSprite *) sprite;

#pragma mark -
#pragma mark Rendering the Thing
- (void) render;
@property (readonly) GCSprite *sprite;

@end
