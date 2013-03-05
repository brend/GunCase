//
//  GCThing.m
//  GunCase
//
//  Created by Philipp Brendel on 12.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCActor.h"
#import <QuartzCore/QuartzCore.h>


@interface GCActor ()
- (void) applyTransformation;
- (void) revertTransformation;
@end


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

- (float) baseline
{
    return self.position.y;
}

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
    
    [self applyTransformation];
    [self renderIndividually];
    [self revertTransformation];
}

- (void) renderIndividually
{
    // To be implemented by subclasses
}

- (void) applyTransformation
{
    glTranslatef(self.position.x, self.position.y, 0);
	glRotatef(self.rotation, 0, 0, 1);
	glScalef(self.scale.width, self.scale.height, 1);
}

- (void) revertTransformation
{
    glScalef(1.0f / self.scale.width, 1.0f / self.scale.height, 0);
    glRotatef(-self.rotation, 0, 0, 1);
    glTranslatef(-self.position.x, -self.position.y, 0);
}

@synthesize visible = _visible;

@end
