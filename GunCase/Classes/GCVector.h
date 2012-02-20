//
//  GCVector.h
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCVector : NSObject
{
@private
	float x, y;
}

+ (id) vectorWithX: (float) x y: (float) y;
+ (id) vectorWithPoint: (NSPoint) p;

- (float) x;
- (float) y;

- (GCVector *) add: (GCVector *) v;
- (GCVector *) subtract: (GCVector *) v;
- (GCVector *) scale: (float) s;

- (float) length;
- (float) distance: (GCVector *) v;

- (NSPoint) point;

@end
