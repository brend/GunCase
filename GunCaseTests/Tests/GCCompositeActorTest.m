//
//  GCCompositeActorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 25.08.12.
//
//

#import "GCCompositeActorTest.h"
#import "GCCompositeActor.h"

@interface GCCompositeActorTest ()
@property (nonatomic, strong) GCCompositeActor *actor;
@end

@implementation GCCompositeActorTest

- (void) setUp
{
    self.actor = [[GCCompositeActor alloc] init];
}

- (void) tearDown
{
    self.actor = nil;
}

- (void) testInit
{
    GCCompositeActor *a = [[GCCompositeActor alloc] init];
    
    STAssertNotNil(a, @"Init returned nil");
}

- (void) testAddComponent
{
    GCActor *c = [[GCActor alloc] init];
    
    [self.actor addComponent: c];
}

- (void) testAddComponentsFromArray
{
    NSArray *a = [NSArray arrayWithObjects: [[GCActor alloc] init], [[GCActor alloc] init], nil];
    
    [self.actor addComponentsFromArray: a];
}

- (void) testRemoveComponent
{
    GCActor *c = [[GCActor alloc] init];
    
    [self.actor addComponent: c];
    [self.actor removeComponent: c];
}

- (void) testRemoveComponentCausesNoException
{
    GCActor *c = [[GCActor alloc] init];
    
    [self.actor removeComponent: c];
}

@end
