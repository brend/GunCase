//
//  GCCompositeThing.h
//  GunCase
//
//  Created by Philipp Brendel on 28.07.12.
//
//

#import "GCThing.h"
#import "GCRenderable.h"

@interface GCCompositeThing : GCThing

- (void) addComponent: (id<GCRenderable>) component;
- (void) addComponentsFromArray: (NSArray *) components;
- (void) removeComponent: (id<GCRenderable>) component;

@end
