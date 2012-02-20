//
//  GCGraphics.m
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCGraphics.h"


#define MAXIMUM_FRAME_RATE 60
#define MINIMUM_FRAME_RATE 15
#define UPDATE_INTERVAL (1.0 / MAXIMUM_FRAME_RATE)
#define MAX_CYCLES_PER_FRAME ((double) MAXIMUM_FRAME_RATE / (double) MINIMUM_FRAME_RATE)

@implementation GCGraphics

+ (id) sharedGraphics
{
	return [[GCGraphics alloc] init];
}

- (NSInteger) minimumFrameRate
{
	return MINIMUM_FRAME_RATE;
}

- (NSInteger) maximumFrameRate
{
	return MAXIMUM_FRAME_RATE;
}

- (double) updateInterval
{
	return UPDATE_INTERVAL;
}

- (double) maxCyclesPerFrame
{
	return MAX_CYCLES_PER_FRAME;
}

@end
