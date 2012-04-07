//
//  GCDirector.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCScene.h"
#import "GCStack.h"

@interface GCDirector : NSObject
{
	GCStack *sceneStack;
}

+ (id) sharedDirector;

- (void) pushScene: (GCScene *) scene;
- (GCScene *) popScene;

- (GCScene *) activeScene;
- (void) updateScene;
- (void) renderScene;

#pragma mark -
#pragma mark Handling User Input
- (void) keyDown: (NSEvent *) theEvent;
- (void) keyUp: (NSEvent *) theEvent;
- (void) mouseDown: (NSEvent *) theEvent;
- (void)mouseUp:(NSEvent *)theEvent;
// NOTE: The window must enable mouse movement tracking for this to take effect
- (void)mouseMoved:(NSEvent *)theEvent;

@end
