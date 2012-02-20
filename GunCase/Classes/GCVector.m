//
//  GCVector.m
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCVector.h"

@implementation GCVector

#pragma mark Initialisation
- (id)initWithX: (float) xcoord y: (float) ycoord
{
    self = [super init];
    if (self) {
        x = xcoord;
		y = ycoord;
    }
    return self;
}

+ (id) vectorWithX: (float) x y: (float) y
{
	return [[GCVector alloc] initWithX: x y: y];
}

+ (id) vectorWithPoint: (NSPoint) p
{
	return [[GCVector alloc] initWithX: p.x y: p.y];
}

#pragma mark -
#pragma mark Access to Vector Components

- (float) x
{
	return x;
}

- (float) y
{
	return y;
}

#pragma mark -
#pragma mark Length and Distance

- (float) length
{
	return sqrtf(x * x + y * y);
}

- (float) distanceTo: (GCVector *) v
{
	return fabsf([[self subtract: v] length]);
}

#pragma mark -
#pragma mark Adding and Subtracting Vectors

- (GCVector *) add: (GCVector *) v
{
	return [GCVector vectorWithX: self.x + v.x
							   y: self.y + v.y];
}

- (GCVector *) subtract: (GCVector *) v
{
	return [GCVector vectorWithX: self.x - v.x
							   y: self.y - v.y];
}

- (GCVector *) scale: (float) s
{
	return [GCVector vectorWithX: s * x
							   y: s * y];
}

- (float) distance:(GCVector *)v
{
	return [[self subtract: v] length];
}

- (NSPoint) point
{
	return NSMakePoint(x, y);
}

@end
