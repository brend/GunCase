//
//  GCScene.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCActor.h"
#import "GCKeyboard.h"

@interface GCScene : GCActor

#pragma mark -
#pragma mark Handling User Input
@property (nonatomic, strong) GCKeyboard *keyboard;
- (void) mouseDown: (NSEvent *) theEvent;
- (void)mouseUp:(NSEvent *)theEvent;
// NOTE: The window must enable mouse movement tracking for this to take effect
- (void)mouseMoved:(NSEvent *)theEvent;

@end
