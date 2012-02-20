//
//  GCGraphics.h
//  GunCase
//
//  Created by Philipp Brendel on 20.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCGraphics : NSObject

+ (id) sharedGraphics;
- (NSInteger) minimumFrameRate;
- (NSInteger) maximumFrameRate;
- (double) updateInterval;
- (double) maxCyclesPerFrame;

@end
