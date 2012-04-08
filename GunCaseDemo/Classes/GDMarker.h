//
//  GDMarker.h
//  GunCase
//
//  Created by Philipp Brendel on 07.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GunCase.h"

@interface GDMarker : NSObject <GCMovable>
{
	GCAnimation *animation;
	GCSprite *sprite;
	NSInteger row, col;
}

@property NSPoint position;
@property float rotation;
@property NSSize scale;

- (void) placeAtRow: (NSInteger) row column: (NSInteger) col;

- (void) update;
- (void) render;

- (void) moveLeft;
- (void) moveRight;
- (void) moveDown;
- (void) moveUp;

@property (readonly) NSInteger row, col;

@end
