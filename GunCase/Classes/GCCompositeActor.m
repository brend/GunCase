//
//  GCCompositeThing.m
//  GunCase
//
//  Created by Philipp Brendel on 28.07.12.
//
//

#import "GCCompositeActor.h"

@interface GCCompositeActor ()
@property (nonatomic, strong) NSMutableArray *components;
@end

@implementation GCCompositeActor

- (id)init
{
    self = [super init];
    if (self) {
        self.components = [NSMutableArray array];
    }
    return self;
}

- (void) addComponent:(id<GCRenderable>)component
{
    [self.components addObject: component];
}

- (void) addComponentsFromArray: (NSArray *) a
{
    [self.components addObjectsFromArray: a];
}

- (void) removeComponent:(id)component
{
    [self.components removeObject: component];
}

- (void) update
{
    [super update];
    
    for (id<GCRenderable> c in self.components) {
        [c update];
    }
}

- (void) render
{
    [super render];
    
    for (id<GCRenderable> c in self.components) {
        [c render];
    }
}

@end
