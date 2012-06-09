//
//  GCDirector.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCVector.h"
#import "GCScene.h"
#import "GCStack.h"
#import "GCUserInterface.h"

@interface GCDirector : NSObject <GCUserInterface>
{
	GCStack *sceneStack;
}

#pragma mark -
#pragma mark Getting the Shared Director
+ (id) sharedDirector;

#pragma mark -
#pragma mark Managing the Scene Stack
- (void) pushScene: (GCScene *) scene;
- (GCScene *) popScene;

@property (readonly) GCScene *activeScene;

- (void) updateScene;
- (void) renderScene;

#pragma mark -
#pragma mark Managing the Camera
@property (nonatomic, copy) GCVector *camera;

#pragma mark -
#pragma mark Handling User Input
- (void) keyDown: (NSEvent *) theEvent;
- (void) keyUp: (NSEvent *) theEvent;
- (void) mouseDown: (NSEvent *) theEvent;
- (void)mouseUp:(NSEvent *)theEvent;
// NOTE: The window must enable mouse movement tracking for this to take effect
- (void)mouseMoved:(NSEvent *)theEvent;

@end
