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

- (id) initWithX: (float) x y: (float) y;
+ (id) vectorWithX: (float) x y: (float) y;
+ (id) vectorWithPoint: (NSPoint) p;
+ (id) zero;

- (float) x;
- (float) y;

- (GCVector *) add: (GCVector *) v;
- (GCVector *) subtract: (GCVector *) v;
- (GCVector *) scale: (float) s;
- (float) dot: (GCVector *) v;
- (float) angle: (GCVector *) v;

- (float) length;
- (float) distance: (GCVector *) v;

- (NSPoint) point;

@end
