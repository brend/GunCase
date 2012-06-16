//
//  GCThing.h
//  GunCase
//
//  Created by Philipp Brendel on 12.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"

@interface GCThing : NSObject <GCMovable>

#pragma mark -
#pragma mark Transforming the Thing
@property (retain) GCVector *position;
@property float rotation;
@property NSSize scale;

#pragma mark -
#pragma mark Updating the Thing
- (void) update;

#pragma mark -
#pragma mark Rendering the Thing
- (void) render;

@end
