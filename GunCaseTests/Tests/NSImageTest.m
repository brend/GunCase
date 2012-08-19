//
//  NSImageTest.m
//  GunCase
//
//  Created by Philipp Brendel on 19.08.12.
//
//

#import "NSImageTest.h"
#import "NSImage+PowersOf2.h"

@implementation NSImageTest

- (void) testImageByResizingToPowersOf2
{
    NSImage *input = [[NSImage alloc] initWithSize: NSMakeSize(11, 128)];
    NSImage *output = [input imageByResizingToPowersOf2];
    
    STAssertEquals(output.size, NSMakeSize(16, 128), @"Wrong size");
}

@end
