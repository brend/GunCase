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
	GCScene *boardScene = [[GDBoardScene alloc] init];
	GCDirector *director = [GCDirector sharedDirector];
	
	[director pushScene: boardScene];	
}

- (void) updateGame
{
	[super updateGame];
}

-(void) drawScene: (NSRect) bounds
{
	[super drawScene: bounds];
}

- (IBAction) toggleTimer: (id) sender
{
}

@end
