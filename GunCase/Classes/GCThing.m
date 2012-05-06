//
//  GCThing.m
//  GunCase
//
//  Created by Philipp Brendel on 12.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCThing.h"

@implementation GCThing
@synthesize 
	position = _position,
	rotation = _rotation,
	scale = _scale;

- (id)init
{
    self = [super init];
    if (self) {
        _position = [GCVector vectorWithX: 0 y: 0];
		_scale = NSMakeSize(1, 1);
    }
    return self;
}

@end
