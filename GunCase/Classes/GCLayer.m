//
//  GCLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayer.h"
#import <QuartzCore/QuartzCore.h>

@implementation GCLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.name = [self description];
		self.rotation = 0;
		self.scale = NSMakeSize(1, 1);
		self.camera = [GCVector zero];
    }
    return self;
}

#pragma mark -
#pragma mark Layer Identity
@synthesize name = _name;


#pragma mark -
#pragma mark Updating the Layer
- (void) update
{
}

#pragma mark -
#pragma mark Rendering the Layer
- (void) render
{
	glTranslatef(self.camera.x, self.camera.y, 0);
	glRotatef(self.rotation, 0, 0, 1);
	glScalef(self.scale.width, self.scale.height, 1);
}

@synthesize rotation, scale, camera;

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
