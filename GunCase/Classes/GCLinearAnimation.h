//
//  GCStep.h
//  GunCase
//
//  Created by Philipp Brendel on 12.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCAnimation.h"
#import "GCVector.h"

@interface GCLinearAnimation : GCAnimation
{
	GCVector *stepOffset;
	NSInteger step, numberOfSteps;
}

+ (id) lineStepFrom: (GCVector *) p
			 to: (GCVector *) q
	   duration: (double) seconds;

@end
