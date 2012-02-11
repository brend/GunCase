//
//  GDMainView.h
//  GunCase
//
//  Created by Philipp Brendel on 05.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GunCase.h"

@interface GDMainView : NSOpenGLView
{
	float a;
}

- (void) startTimer;
- (void) stopTimer;

@property (retain) NSTimer *timer;
@property (retain) GCSprite *sprite;

- (IBAction) toggleTimer: (id) sender;

@end
