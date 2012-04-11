//
//  GCLayer.h
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCUserInterface.h"

@interface GCLayer : NSObject <GCUserInterface>

#pragma mark -
#pragma mark Layer Identity
@property (copy) NSString *name;

#pragma mark -
#pragma mark Updating the Layer
- (void) update;

#pragma mark -
#pragma mark Rendering the Layer
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
