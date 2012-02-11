//
//  GDMainView.m
//  GunCase
//
//  Created by Philipp Brendel on 05.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDMainView.h"
#import <QuartzCore/QuartzCore.h>
#import "GunCase.h"

#define GMWorldWidth	(self.frame.size.width)
#define GMWorldHeight	(self.frame.size.height)

@implementation GDMainView

@synthesize sprite = _sprite, timer = _timer;

- (void)reshape
{	
	[self stopTimer];
	
	NSRect rect = self.frame; 
	
	glMatrixMode(GL_PROJECTION); 
	glLoadIdentity();
	glOrtho(-GMWorldWidth * 0.5, GMWorldWidth * 0.5,
			-GMWorldHeight * 0.5, GMWorldHeight * 0.5,
			-1, 1);
	glViewport(0, 0, rect.size.width, rect.size.height);
	
	glMatrixMode(GL_MODELVIEW);	
	// Set a blending function to use
	glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
	// Enable blending
	glEnable(GL_BLEND);
	// Enable culling
	glEnable(GL_CULL_FACE);
	glCullFace(GL_BACK);
	
	// [self.delegate gameViewDidReshape: self];
	[self setNeedsDisplay: YES];
	[self startTimer];
}

- (void) prepareOpenGL
{
//	glClearColor(1, 1, 0, 1);
}

- (void) startTimer
{
	if (self.timer)
		return;
	
	self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 / 60 target: self selector: @selector(redraw:) userInfo: nil repeats: YES];
}

- (void) stopTimer
{
	[self.timer invalidate];
	self.timer = nil;
}

- (void) redraw: (id) sender
{
	a+=0.02;
	
	[self drawRect: self.frame];
}

-(void) drawRect: (NSRect) bounds
{
	if (self.sprite == nil) {
		NSImage *image = [NSImage imageNamed: @"walker"];
		
		self.sprite = [GCSprite spriteWithImage: image];
	}
	
	glClearColor(sin(a), 1, 0, 1);
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	float x = 100 * cosf(a), y = 100 * sinf(a);

	[self.sprite drawAtX: x y: y
				rotation: 5 * a
				   scale: NSMakeSize(5 * fabs(sin((5 * a))), 3 * fabs(sin((5 * a))))];
	
	
	[self.sprite drawStatusBars: self.frame.size];
	
	
	glFlush(); 
}

- (IBAction) toggleTimer: (id) sender
{
	if (self.timer)
		[self stopTimer];
	else
		[self startTimer];
}

@end
