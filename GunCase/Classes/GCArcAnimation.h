//
//  GCArcAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 10.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCTimedAnimation.h"
#import "GCVector.h"

@interface GCArcAnimation : GCTimedAnimation
{
	float startAngle, stepAngle, radius;
	GCVector *center;
}

+ (id) animationWithCenter: (GCVector *) c
					radius: (float) r
				startAngle: (float) s
				  endAngle: (float) e
				  duration: (double) seconds;

@end
