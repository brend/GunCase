//
//  GCTimedAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 11.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCAnimation.h"

@interface GCTimedAnimation : GCAnimation

- (id) initWithDuration: (double) seconds;

@property (readonly) NSInteger numberOfSteps;
@property NSInteger currentStep;

@end
