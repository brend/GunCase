//
//  GCLayeredScene.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayeredScene.h"

@implementation GCLayeredScene

- (id)init
{
    self = [super init];
    if (self) {
        layers = [NSMutableArray array];
    }
    return self;
}

#pragma mark -
#pragma mark Managing the Layers
- (void) insertLayer:(GCLayer *)layer 
			 atIndex:(NSUInteger)index
{
	[layers insertObject: layer atIndex: self.layerCount];
}

- (void) addLayer:(GCLayer *)layer
{
	[self insertLayer: layer atIndex: 0];
}

- (NSUInteger) layerCount
{
	return layers.count;
}

#pragma mark -
#pragma mark Updating the Layer
- (void) update
{
	for (GCLayer *layer in layers) {
		[layer update];
	}
}

#pragma mark -
#pragma mark Rendering the Layer
- (void) render
{
	for (GCLayer *layer in layers) {
		[layer render];
	}
}

@end
