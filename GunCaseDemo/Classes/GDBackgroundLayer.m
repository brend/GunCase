//
//  GDBoardBackgroundLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDBackgroundLayer.h"

@implementation GDBackgroundLayer

- (id)init
{
    self = [super init];
    if (self) {
		board = [GCSprite spriteWithImage: [NSImage imageNamed: @"board"]];
		background = [GCSprite spriteWithImage: [NSImage imageNamed: @"background"]];
    }
    return self;
}

- (void) render
{
	[super render];
	[background drawAtX: 0 y: 0];
	[board drawAtX: 0 y: 0];
}

@end
