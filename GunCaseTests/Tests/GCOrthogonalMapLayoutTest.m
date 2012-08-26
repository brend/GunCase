//
//  GCOrthogonalMapLayoutTest.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCOrthogonalMapLayoutTest.h"
#import "GCOrthogonalMapLayout.h"

@implementation GCOrthogonalMapLayoutTest

- (void) testNext
{
    GCOrthogonalMapLayout *layout = [[GCOrthogonalMapLayout alloc] init];
    
    layout.width = 2;
    layout.height = 5;
    layout.tileWidth = 32;
    layout.tileHeight = 64;
    
    GCVector
        *a = [layout next],
        *b = [layout next],
        *c = [layout next];
    
    STAssertNotNil(a, @"First vector is nil");
    STAssertNotNil(b, @"Second vector is nil");
    STAssertNotNil(c, @"Third vector is nil");
    
    GCVector
        *expectedA = [GCVector vectorWithX: 0 y: 320],
        *expectedB = [GCVector vectorWithX: 32 y: 320],
        *expectedC = [GCVector vectorWithX: 0 y: 256];
    
    STAssertEqualObjects(a, expectedA, @"First vector is wrong");
    STAssertEqualObjects(b, expectedB, @"Second vector is wrong");
    STAssertEqualObjects(c, expectedC, @"Third vector is wrong");
}

@end
