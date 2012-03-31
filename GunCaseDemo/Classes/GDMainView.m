//
//  GDMainView.m
//  GunCase
//
//  Created by Philipp Brendel on 05.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDMainView.h"
#import "GunCase.h"
#import "GDBoardScene.h"

@implementation GDMainView

- (void) setup
{
	guys = [NSMutableSet set];
	
	[guys addObject: [[GDGuy alloc] initWithRectangularAnimation]];
	[guys addObject: [[GDGuy alloc] initWithCircularAnimation]];
	
	GCScene *boardScene = [[GDBoardScene alloc] init];
	GCDirector *director = [GCDirector sharedDirector];
	
	[director pushScene: boardScene];	
}

- (void) updateGame
{
	[super updateGame];
	
	for (GDGuy *guy in guys)
		[guy update];
}

-(void) drawScene: (NSRect) bounds
{
	[super drawScene: bounds];
	
	for (GDGuy *guy in guys)
		[guy draw];
}

- (IBAction) toggleTimer: (id) sender
{
	for (GDGuy *guy in guys)
		[guy reset];
}

@end
