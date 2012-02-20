//
//  GDMainView.h
//  GunCase
//
//  Created by Philipp Brendel on 05.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GunCase.h"
#import "GDGuy.h"

@interface GDMainView : NSOpenGLView
{
	NSMutableSet *guys;
	GCGraphics *graphics;
}

- (void) startTimer;
- (void) stopTimer;

@property (retain) NSTimer *timer;

- (IBAction) toggleTimer: (id) sender;

- (void) prepareFrame;

@end
