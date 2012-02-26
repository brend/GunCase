//
//  GDMainView.m
//  GunCase
//
//  Created by Philipp Brendel on 05.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDMainView.h"
#import "GunCase.h"

@implementation GDMainView

- (void) updateGame
{
	if (guys == nil) {
		guys = [NSMutableSet set];
		
		for (int i = 0; i < 1; ++i)
			[guys addObject: [[GDGuy alloc] init]];
	}
	
	for (GDGuy *guy in guys)
		[guy update];
}

-(void) drawScene: (NSRect) bounds
{
	for (GDGuy *guy in guys)
		[guy draw];
}

- (IBAction) toggleTimer: (id) sender
{
	for (GDGuy *guy in guys)
		[guy reset];
}

@end
