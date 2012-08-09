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
#import "GDMapScene.h"

@implementation GDMainView

- (void) setup
{
	GCDirector *director = [GCDirector sharedDirector];
	GCScene *scene =
        //[[GDBoardScene alloc] init];
        [[GDMapScene alloc] init];
	
	[director pushScene: scene];
}

- (void) updateGame
{
	[super updateGame];
}

-(void) drawScene: (NSRect) bounds
{
	[super drawScene: bounds];
}

@end
