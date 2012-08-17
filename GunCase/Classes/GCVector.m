//
//  GCVector.m
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCVector.h"

@implementation GCVector

#pragma mark Initialization

- (id)initWithX: (float) xcoord y: (float) ycoord
{
    self = [super init];
    if (self) {
        x = xcoord;
		y = ycoord;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	GCVector *copy = [[GCVector alloc] initWithX: self.x y: self.y];
	
	return copy;
}

+ (id) vectorWithX: (float) x y: (float) y
{
	return [[GCVector alloc] initWithX: x y: y];
}

+ (id) vectorWithPoint: (NSPoint) p
{
	return [[GCVector alloc] initWithX: p.x y: p.y];
}

+ (id) zero
{
	return [[GCVector alloc] initWithX: 0 y: 0];
}

#pragma mark -
#pragma mark Accessing Vector Components

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

- (GCVector *) addX: (float) xOffset y: (float) yOffset
{
    return [GCVector vectorWithX: self.x + xOffset
                               y: self.y + yOffset];
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

- (float) dot: (GCVector *) v
{
	return x * v.x + y * v.y;
}

- (float) angle: (GCVector *) v
{
	float dot = [self dot: v];
	float lenProd = self.length * v.length;
	
	return acosf(dot / lenProd);
}

#pragma mark -
#pragma mark Conversion to Other Data Types

- (NSPoint) point
{
	return NSMakePoint(x, y);
}

- (NSString *) description
{
	return [NSString stringWithFormat: @"(%f, %f)", x, y];
}

#pragma mark -
#pragma mark Vector Equality

- (BOOL) isEqual: (id) anObject
{
	if (!([anObject respondsToSelector: @selector(x)]
		   && [anObject respondsToSelector: @selector(y)]))
		return NO;
	
	return self.x == (float) [anObject x]
		&& self.y == (float) [anObject y];
}

@end
