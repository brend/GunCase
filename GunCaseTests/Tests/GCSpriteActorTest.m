//
//  GCSpriteActorTest.m
//  GunCase
//
//  Created by Philipp Brendel on 25.08.12.
//
//

#import "GCSpriteActorTest.h"
#import "GCSpriteActor.h"

@interface GCSpriteActorTest ()
@property (nonatomic, strong) GCSpriteActor *actor;
@end

@implementation GCSpriteActorTest

- (void) setUp
{
    self.actor = [[GCSpriteActor alloc] init];
}

- (void) tearDown
{
    self.actor = nil;
}

- (void) testInit
{
    GCSpriteActor *a = [[GCSpriteActor alloc] init];
    
    STAssertNotNil(a, @"Actor is nil");
}

- (void) testInitWithSprite
{
    GCSprite *s = [[GCSprite alloc] init];
    GCSpriteActor *a = [[GCSpriteActor alloc] initWithSprite: s];
    
    STAssertEqualObjects(a.sprite, s, @"Different sprite");
}

- (void) testRender
{
    [self.actor render];
}

@end
