//
//  GCThing.h
//  GunCase
//
//  Created by Philipp Brendel on 12.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMovable.h"

@interface GCThing : NSObject <GCMovable>

@property (retain) GCVector *position;
@property float rotation;
@property NSSize scale;

@end
