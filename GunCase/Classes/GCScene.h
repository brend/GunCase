//
//  GCScene.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCScene : NSObject

#pragma mark -
#pragma mark Updating the Scene
- (void) update;

#pragma mark -
#pragma mark Rendering the Scene
- (void) render;
@property float rotation;
@property NSSize scale;

#pragma mark -
#pragma mark Handling User Input
- (void)keyDown:(NSEvent *)theEvent;
- (void)keyUp:(NSEvent *)theEvent;
- (void) mouseDown: (NSEvent *) theEvent;
- (void)mouseUp:(NSEvent *)theEvent;
// NOTE: The window must enable mouse movement tracking for this to take effect
- (void)mouseMoved:(NSEvent *)theEvent;

@end
