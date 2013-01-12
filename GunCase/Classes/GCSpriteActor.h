//
//  GCSpriteThing.h
//  GunCase
//
//  Created by Philipp Brendel on 14.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCActor.h"
#import "GCSprite.h"

@interface GCSpriteActor : GCActor <GCMovable, GCRenderable>
{
	GCSprite *_sprite;
    GCVector *_drawingOffset;
}

#pragma mark -
#pragma mark Initialization
- (id) initWithSprite: (GCSprite *) sprite;

#pragma mark -
#pragma mark Rendering the Thing
@property (nonatomic) GCSprite *sprite;
@property (nonatomic, retain) GCVector *drawingOffset;

@end
