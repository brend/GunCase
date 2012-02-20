//
//  GCStep.h
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"
#import "GCVector.h"

@interface GCStep : NSObject
{
	GCVector *stepOffset;
	NSInteger step, numberOfSteps;
}

+ (id) lineFrom: (GCVector *) p
			 to: (GCVector *) q
	   duration: (double) seconds;

- (void) advance: (id<GCMovable>) target;
- (BOOL) finished;
- (void) rewind;

@end
