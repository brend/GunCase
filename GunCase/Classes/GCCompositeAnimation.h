//
//  GCCompositeAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"
#import "GCVector.h"

@interface GCCompositeAnimation : NSObject
{
	NSMutableArray *steps;
	NSInteger currentStep;
}

- (id) init;
+ (id) animation;

- (id) lineFrom: (GCVector *) p
			   To: (GCVector *) q
		 duration: (double) seconds;

- (void) advance: (id<GCMovable>) target;
- (BOOL) isFinished;
- (void) rewind;

@end
