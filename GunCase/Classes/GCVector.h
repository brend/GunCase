//
//  GCVector.h
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCVector : NSObject <NSCopying>
{
@private
	float x, y;
}

#pragma mark -
#pragma mark Initialization

- (id) initWithX: (float) x y: (float) y;
+ (id) vectorWithX: (float) x y: (float) y;
+ (id) vectorWithPoint: (NSPoint) p;
+ (id) zero;

#pragma mark -
#pragma Accessing Vector Components

@property (nonatomic, readonly) float x, y, length;

#pragma mark -
#pragma mark Vector Arithmetics

- (GCVector *) add: (GCVector *) v;
- (GCVector *) addX: (float) x y: (float) y;
- (GCVector *) subtract: (GCVector *) v;
- (GCVector *) scale: (float) s;
- (float) dot: (GCVector *) v;
- (float) angle: (GCVector *) v;
- (float) distance: (GCVector *) v;

#pragma mark -
#pragma mark Converting the Vector

- (NSPoint) point;

@end
