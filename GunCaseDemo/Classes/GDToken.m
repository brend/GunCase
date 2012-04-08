//
//  GDToken.m
//  GunCase
//
//  Created by Philipp Brendel on 08.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GDToken.h"

@implementation GDToken

static GDToken *tokenX = nil, *tokenO = nil, *tokenNone = nil;
static GCSprite *spriteX = nil, *spriteO = nil;

- (id)initWithSprite: (GCSprite *) s
{
    self = [super init];
    if (self) {
        sprite = s;
    }
    return self;
}

+ (void) initialize
{
	spriteX = [GCSprite spriteWithImage: [NSImage imageNamed: @"x"]];
	spriteO = [GCSprite spriteWithImage: [NSImage imageNamed: @"o"]];
	
	tokenX = [[GDToken alloc] initWithSprite: spriteX];
	tokenO = [[GDToken alloc] initWithSprite: spriteO];
	tokenNone = [[GDToken alloc] initWithSprite: nil];
}

+ (id) tokenX
{
	return tokenX;
}

+ (id) tokenO
{
	return tokenO;
}

+ (id) tokenNone
{
	return tokenNone;
}

- (void) drawAtRow: (NSInteger) row
			   col: (NSInteger) col
{
	NSSize fieldSize = NSMakeSize(128, 128);
	float
		x = (col - 1) * fieldSize.width,
		y = (1 - row) * fieldSize.height;
	
	[sprite drawAtX: x y: y];
}

- (BOOL) isNone
{
	return self == tokenNone;
}

- (GDToken *) theOtherOne
{
	if (self == tokenNone)
		return self;
	
	return self == tokenX ? tokenO : tokenX;
}

- (GCSprite *) sprite
{
	return sprite;
}

- (NSString *) description
{
	if (self == tokenNone)
		return @"NONE";
	if (self == tokenX)
		return @"X";
	if (self == tokenO)
		return @"O";
	
	return @"??? Who am I??";
}

@end
