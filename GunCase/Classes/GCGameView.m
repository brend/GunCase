//
//  GCGameView.m
//  GunCase
//
//  Created by Philipp Brendel on 26.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCGameView.h"
#import <QuartzCore/QuartzCore.h>
#import "GunCase.h"

#define GMWorldWidth	(self.frame.size.width)
#define GMWorldHeight	(self.frame.size.height)

@interface GCGameView ()
- (void) startTimer;
- (void) stopTimer;
@property (retain) NSTimer *timer;
@property (retain) GCGraphics *graphics;
- (void) prepareFrame;
@end

@implementation GCGameView
@synthesize timer = _timer, graphics = _graphics;

- (void)reshape
{	
	[self stopTimer];
	
	self.graphics = [GCGraphics sharedGraphics];
	
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
	GLint swapInt = 1;
	
    [[self openGLContext] setValues:&swapInt forParameter:NSOpenGLCPSwapInterval];
}

- (void) startTimer
{
	if (self.timer)
		return;
	
	self.timer = 
		[NSTimer timerWithTimeInterval:0.001   //a 1ms time interval
								 target:self
							   selector:@selector(timerFired:)
							   userInfo:nil
								repeats:YES];
	 
	 [[NSRunLoop currentRunLoop] addTimer: self.timer
								  forMode:NSDefaultRunLoopMode];
	 [[NSRunLoop currentRunLoop] addTimer: self.timer 
								  forMode:NSEventTrackingRunLoopMode]; //Ensure timer fires during resize
}

- (void) stopTimer
{
	[self.timer invalidate];
	self.timer = nil;
}

- (void) updateGame
{
	// To be implemented in subclass
}

- (void) prepareFrame
{
	double updateInterval = self.graphics.updateInterval, 
		maxCyclesPerFrame = self.graphics.maxCyclesPerFrame;
	
	static double lastFrameTime = 0.0;
	static double cyclesLeftOver = 0.0;
	double currentTime;
	double updateIterations;
	
	currentTime = [NSDate timeIntervalSinceReferenceDate];
	if (lastFrameTime == 0)
		lastFrameTime = [NSDate timeIntervalSinceReferenceDate];
	updateIterations = ((currentTime - lastFrameTime) + cyclesLeftOver);
	
	if (updateIterations > (maxCyclesPerFrame * updateInterval)) {
		updateIterations = (maxCyclesPerFrame * updateInterval);
	}
	
	while (updateIterations > updateInterval) {
		updateIterations -= updateInterval;
		
		[self updateGame];
	}
		
	cyclesLeftOver = updateIterations;
	lastFrameTime = currentTime;
}

- (void) timerFired: (id) sender
{
	[self prepareFrame];
	[self drawRect: self.frame];
}

-(void) drawRect: (NSRect) bounds
{
	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();
	
	[self drawScene: bounds];
	
	glFlush(); 
}

- (void) drawScene:(NSRect)rect
{
	// To be implemented in subclass
}

@end
