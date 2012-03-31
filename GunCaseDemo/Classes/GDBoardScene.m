//
//  GDBoardScene.m
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDBoardScene.h"

@implementation GDBoardScene

- (id)init
{
    self = [super init];
    if (self) {
        boardSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"board"]];
		xSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"x"]];
		oSprite = [GCSprite spriteWithImage: [NSImage imageNamed: @"o"]];
    }
    return self;
}

- (void) advance
{
	
}

- (void) render
{
	[boardSprite drawAtX: 0 y: 0];
	[oSprite drawAtX: 0 y: 0];
	[xSprite drawAtX: 0 y: 0];
}

@end
