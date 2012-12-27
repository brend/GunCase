//
//  GCThing.m
//  GunCase
//
//  Created by Philipp Brendel on 12.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCActor.h"
#import <QuartzCore/QuartzCore.h>

#import "GCMapLayer.h"


@implementation GCActor

#pragma mark -
#pragma mark Initialization
- (id)init
{
    self = [super init];
    if (self) {
        _position = [GCVector vectorWithX: 0 y: 0];
		_scale = NSMakeSize(1, 1);
		_rotation = 0;
        
        _visible = YES;
    }
    return self;
}

#pragma mark -
#pragma mark Transforming the Thing
@synthesize 
	position = _position,
	rotation = _rotation,
	scale = _scale;

#pragma mark -
#pragma mark Updating the Thing
- (void) update
{
}

#pragma mark -
#pragma mark Rendering the Thing
- (void) render
{
    if (!self.visible)
        return;
    
	glTranslatef(self.position.x, self.position.y, 0);
	glRotatef(self.rotation, 0, 0, 1);
	glScalef(self.scale.width, self.scale.height, 1);
}

@synthesize visible = _visible;

@end
