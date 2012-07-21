//
//  GCLayeredScene.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayeredScene.h"
#import <QuartzCore/QuartzCore.h>

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

- (void) removeLayerAtIndex: (NSUInteger) index
{
	[layers removeObjectAtIndex: index];
}

- (void) removeLayer: (GCLayer *) layer
{
	NSUInteger index = [layers indexOfObject: layer];
	
	if (index != NSNotFound)
		[self removeLayerAtIndex: index];
}

- (void) clearLayers
{
	[layers removeAllObjects];
}

- (NSUInteger) layerCount
{
	return layers.count;
}

@synthesize respondingLayer = _respondingLayer;

- (GCLayer *) layerNamed: (NSString *) name
{
	if (name == nil)
		return nil;
	
	for (GCLayer *layer in layers) {
		if ([name isEqualToString: layer.name])
			return layer;
	}
	
	return nil;
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
	[super render];
	
	for (GCLayer *layer in layers) {
		glPushMatrix();
		[layer render];
		glPopMatrix();
	}
}

#pragma mark -
#pragma mark Handling User Input

- (GCKeyboard *) keyboard
{
    return self.respondingLayer ? self.respondingLayer.keyboard : super.keyboard;
}

- (void) mouseDown: (NSEvent *) theEvent
{
	[self.respondingLayer mouseDown: theEvent];
}

- (void)mouseUp:(NSEvent *)theEvent
{
	[self.respondingLayer mouseUp: theEvent];
}

// NOTE: The window must enable mouse movement tracking for this to take effect
- (void)mouseMoved:(NSEvent *)theEvent
{
	[self.respondingLayer mouseMoved: theEvent];
}

@end
