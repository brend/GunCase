//
//  GCAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"

@interface GCAnimation : NSObject

+ (id) linearAnimationFrom: (NSPoint) p
						to: (NSPoint) q;

- (void) apply: (id<GCMovable>) target;

- (void) advance;

@end
