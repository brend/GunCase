//
//  GCScene.m
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCScene.h"
#import <QuartzCore/QuartzCore.h>

@implementation GCScene

- (id)init
{
    self = [super init];
    if (self) {
		_rotation = 0;
        _scale = NSMakeSize(1, 1);
    }
    return self;
}

#pragma mark -
#pragma mark Updating the Scene
- (void) update
{
}

#pragma mark -
#pragma mark Rendering the Scene
- (void) render
{
	glTranslatef(_camera.x, _camera.y, 0);
	glRotatef(_rotation, 0, 0, 1);
	glScalef(_scale.width, _scale.height, 1);
}

@synthesize
	camera = _camera,
	rotation = _rotation,
	scale = _scale;

#pragma mark -
#pragma mark Handling User Input
- (void)keyDown:(NSEvent *)theEvent
{
}

- (void)keyUp:(NSEvent *)theEvent
{
}

- (void) mouseDown: (NSEvent *) theEvent
{
}

- (void)mouseUp:(NSEvent *)theEvent
{
}

- (void)mouseMoved:(NSEvent *)theEvent
{
}

@end
