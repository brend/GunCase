//
//  GCCompositeAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCAnimation.h"
#import "GCVector.h"

@interface GCCompositeAnimation : GCAnimation
{
	NSMutableArray *steps;
	NSInteger currentStep;
}

- (id) init;
+ (id) animation;

- (id) lineFrom: (GCVector *) p
			   To: (GCVector *) q
		 duration: (double) seconds;
- (id) arcWithCenter: (GCVector *) c
			  radius: (float) r
		  startAngle: (float) s
			endAngle: (float) e
			duration: (double) seconds;

@end
