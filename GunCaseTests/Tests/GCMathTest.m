//
//  GCMathTest.m
//  GunCase
//
//  Created by Philipp Brendel on 19.08.12.
//
//

#import "GCMathTest.h"
#import "GCMath.h"

@implementation GCMathTest

- (void) testNearestPowerOf2
{
    NSInteger
        args[] =     { -5, 0, 1, 2, 3, 4, 5, 7, 11, 16, 29, 64, 100, 325,  513 },
        expected[] = {  1, 1, 1, 2, 4, 4, 8, 8, 16, 16, 32, 64, 128, 512, 1024};
    
    for (NSInteger i = 0; i < sizeof(args) / sizeof(NSInteger); ++i) {
        NSInteger input = args[i];
        NSInteger output = GCNearestPowerOf2(input);
        NSInteger e = expected[i];
        
        STAssertEquals(output, e, @"Unexpected result");
    }
}

@end
