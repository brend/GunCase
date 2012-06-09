//
//  GCDirector.m
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCDirector.h"
#import <QuartzCore/QuartzCore.h>

#pragma mark -
#pragma mark GCDirector Implementation
@implementation GCDirector

static GCStack *GCDirectorSceneStack = nil;
static GCVector *GCDirectorCamera = nil;

- (id)init
{
    self = [super init];
    if (self) {
        sceneStack = GCDirectorSceneStack;
    }
    return self;
}

+ (void) initialize
{
	GCDirectorSceneStack = [[GCStack alloc] init];
	GCDirectorCamera = [[GCVector alloc] initWithX: 0 y: 0];
}

+ (id) sharedDirector
{
	return [[GCDirector alloc] init];
}

- (void) pushScene: (GCScene *) scene
{
	[sceneStack push: scene];
}

- (GCScene *) popScene
{
	return sceneStack.pop;
}

- (GCScene *) activeScene
{
	return [sceneStack peek];
}

- (void) updateScene
{
	[self.activeScene update];
}

- (void) renderScene
{
	// Apply the camera translation
	glTranslatef(self.camera.x, self.camera.y, 0);
	
	// Render the scene
	[self.activeScene render];
}

#pragma mark -
#pragma mark Managing the Camera
- (GCVector *) camera
{
	return GCDirectorCamera;
}

- (void) setCamera:(GCVector *)camera
{
	GCDirectorCamera = [camera copy];
}

#pragma mark -
#pragma mark Handling User Input

- (void) keyDown:(NSEvent *)theEvent
{
	[self.activeScene keyDown: theEvent];
}

- (void) keyUp: (NSEvent *) theEvent
{
	[self.activeScene keyUp: theEvent];
}

- (void) mouseDown: (NSEvent *) theEvent
{
	[self.activeScene mouseDown: theEvent];
}

- (void)mouseUp:(NSEvent *)theEvent
{
	[self.activeScene mouseUp: theEvent];
}

- (void)mouseMoved:(NSEvent *)theEvent
{
	[self.activeScene mouseMoved: theEvent];
}

@end
