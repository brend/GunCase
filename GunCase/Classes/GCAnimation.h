//
//  GCAnimation.h
//  GunCase
//
//  Created by Philipp Brendel on 10.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"

@interface GCAnimation : NSObject

- (void) advance: (id<GCMovable>) target;
@property (readonly) BOOL isFinished;
- (void) rewind;

@end
