//
//  GCLayeredScene.h
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCScene.h"
#import "GCLayer.h"

@interface GCLayeredScene : GCScene
{
	NSMutableArray *layers;
}

#pragma mark -
#pragma mark Managing the Layers
- (void) addLayer: (GCLayer *) layer;

- (void) insertLayer: (GCLayer *) layer
			 atIndex: (NSUInteger) index;

- (void) removeLayerAtIndex: (NSUInteger) index;

- (void) removeLayer: (GCLayer *) layer;

- (void) clearLayers;

- (NSUInteger) layerCount;

@property (retain) GCLayer *respondingLayer;

- (GCLayer *) layerNamed: (NSString *) name;


@end
