//
//  GCIsometricMapLayoutTest.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCIsometricMapLayoutTest.h"
#import "GCIsometricMapLayout.h"

@interface GCIsometricMapLayoutTest ()
@property (nonatomic, strong) GCIsometricMapLayout *layout;
@end

@implementation GCIsometricMapLayoutTest

- (void) setUp
{
    self.layout = [[GCIsometricMapLayout alloc] init];
}

- (void) tearDown
{
    self.layout = nil;
}

- (void) testInit
{
    STAssertNotNil(self.layout, @"Init returned nil");
}

- (void) testNext
{
//    self.layout.width = 3;
//    self.layout.height = 2;
//    self.layout.tileWidth = 32;
//    self.layout.tileHeight = 32;
//    
//    GCVector
//        *a = [self.layout next],
//        *b = [self.layout next],
//        *c = [self.layout next],
//        *d = [self.layout next];
//    
//    STAssertNotNil(a, @"First vector is nil");
//    STAssertNotNil(b, @"Second vector is nil");
//    STAssertNotNil(c, @"Third vector is nil");
//    STAssertNotNil(d, @"Fourth vector is nil");
//    
//    GCVector
//        *expectedA = [GCVector vectorWithX:   0  y:   0],
//        *expectedB = [GCVector vectorWithX:  16  y:  -8],
//        *expectedC = [GCVector vectorWithX:  32  y: -16],
//        *expectedD = [GCVector vectorWithX: -16  y:  -8];
//    
//    STAssertEqualObjects(a, expectedA, @"First vector is wrong");
//    STAssertEqualObjects(b, expectedB, @"Second vector is wrong");
//    STAssertEqualObjects(c, expectedC, @"Third vector is wrong");
//    STAssertEqualObjects(d, expectedD, @"Fourth vector is wrong");
}

@end
