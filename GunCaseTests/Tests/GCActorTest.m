//
//  GCActorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 19.08.12.
//
//

#import "GCActorTest.h"
#import "GCActor.h"

@interface GCActorTest ()
@property (nonatomic, strong) GCActor *actor;
@end

@implementation GCActorTest

- (void) setUp
{
    self.actor = [[GCActor alloc] init];
}

- (void) tearDown
{
    self.actor = nil;
}

- (void) testInit
{
    GCActor *a = [[GCActor alloc] init];
    
    STAssertNotNil(a, @"Actor is nil");
    STAssertNotNil(a.position, @"Position mustn't be nil");
    STAssertEquals(a.scale, NSMakeSize(1, 1), @"Scale must be 1x1");
    STAssertEquals(a.rotation, 0.0f, @"Rotation must be 0");
}

- (void) testRender
{
    [self.actor render];
}

@end
