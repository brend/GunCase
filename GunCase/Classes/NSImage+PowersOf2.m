//
//  NSImage+PowersOf2.m
//  GunCase
//
//  Created by Philipp Brendel on 12.08.12.
//
//

#import "NSImage+PowersOf2.h"
#import "GCMath.h"

@implementation NSImage (PowersOf2)

- (NSImage *) imageByResizingToPowersOf2
{
    NSInteger
        width = self.size.width,
        height = self.size.height;
    NSInteger
        adjustedWidth = GCNearestPowerOf2(width),
        adjustedHeight = GCNearestPowerOf2(height);
    
    if (width == adjustedWidth && height == adjustedHeight)
        return self;
    
    NSImage *adjustedImage =
        [[NSImage alloc] initWithSize: NSMakeSize(adjustedWidth, adjustedHeight)];
    
    [adjustedImage lockFocus];
    [self drawAtPoint: NSZeroPoint
              fromRect: NSMakeRect(0, 0, width, height)
             operation: NSCompositeSourceOver
              fraction: 1];
    [adjustedImage unlockFocus];
    
    return adjustedImage;
}

@end
