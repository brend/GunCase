//
//  GDToken.h
//  GunCase
//
//  Created by Philipp Brendel on 08.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GunCase.h"

@interface GDToken : NSObject
{
	GCSprite *sprite;
}

+ (id) tokenX;
+ (id) tokenO;
+ (id) tokenNone;

- (BOOL) isNone;
- (GDToken *) theOtherOne;

- (void) drawAtRow: (NSInteger) row
			   col: (NSInteger) col;

- (GCSprite *) sprite;

@end
