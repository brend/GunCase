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

- (void) insertComponent: (id<GCRenderable>) component atIndex: (NSUInteger) index
{
    [self.components insertObject: component atIndex: index];
}

- (void) addComponentsFromArray: (NSArray *) a
{
    [self.components addObjectsFromArray: a];
}

- (void) removeComponent:(id)component
{
    [self.components removeObject: component];
}

- (void) removeComponentAtIndex: (NSUInteger) index
{
    [self.components removeObjectAtIndex: index];
}

- (void) update
{
    [super update];
    
    for (id<GCRenderable> c in self.components) {
        [c update];
    }
}

- (void) renderIndividually
{
    for (id<GCRenderable> c in self.components) {
        [c render];
    }
}

@end
