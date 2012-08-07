//
//  GCCompositeThing.h
//  GunCase
//
//  Created by Philipp Brendel on 28.07.12.
//
//

#import "GCActor.h"

@interface GCCompositeThing : GCActor <GCMovable, GCRenderable>

- (void) addComponent: (id<GCRenderable>) component;
- (void) addComponentsFromArray: (NSArray *) components;
- (void) removeComponent: (id<GCRenderable>) component;

@end
