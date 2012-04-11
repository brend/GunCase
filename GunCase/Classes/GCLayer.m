//
//  GCLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayer.h"

@implementation GCLayer

- (id)init
{
    self = [super init];
    if (self) {
        _name = [self description];
		_rotation = 0;
		_scale = NSMakeSize(1, 1);
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
}

@synthesize rotation = _rotation, scale = _scale;

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
