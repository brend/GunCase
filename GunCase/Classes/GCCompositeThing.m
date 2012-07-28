//
//  GCCompositeThing.m
//  GunCase
//
//  Created by Philipp Brendel on 28.07.12.
//
//

#import "GCCompositeThing.h"

@interface GCCompositeThing ()
@property (nonatomic, strong) NSMutableArray *components;
@end


@implementation GCCompositeThing

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

- (void) render
{
    // TODO: A composite thing is like a layer,
    // TODO: in that its components must move along with it.
    // TODO: This has not yet been implemented.
    for (id<GCRenderable> c in self.components) {
        [c render];
    }
}

@end
