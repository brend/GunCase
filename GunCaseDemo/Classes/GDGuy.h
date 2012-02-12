//
//  GDGuy.h
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GunCase.h"

@interface GDGuy : NSObject <GCMovable>
@property NSPoint position;
@property float rotation;
@property NSSize scale;
@property (retain) GCAnimation *animation;
@property (retain) GCSprite *sprite;
- (void) draw;
- (void) flip;
@end
