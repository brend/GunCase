//
//  GCMapLayoutTest.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCMapLayoutTest.h"
#import "GCMapLayout.h"

@interface GCMapLayoutTest ()
@property (nonatomic, strong) GCMapLayout *layout;
@end

@implementation GCMapLayoutTest

- (void) setUp
{
    self.layout = [[GCMapLayout alloc] init];
}

- (void) tearDown
{
    self.layout = nil;
}

- (void) testInit
{
    STAssertNotNil(self.layout, @"Init returned nil");
}

- (void) testTileIndex
{
    NSInteger expected = 17;
    
    self.layout.tileIndex = expected;
    
    STAssertEquals(self.layout.tileIndex, expected, @"Wrong tile index");
}

- (void) testWidth
{
    NSInteger expected = 32;
    
    self.layout.width = expected;
    
    STAssertEquals(self.layout.width, expected, @"Wrong width");
}

- (void) testHeight
{
    NSInteger expected = 29;
    
    self.layout.height = expected;
    
    STAssertEquals(self.layout.height, expected, @"Wrong height");
}

- (void) testTileWidht
{
    NSInteger expected = 212;
    
    self.layout.tileWidth = expected;
    
    STAssertEquals(self.layout.tileWidth, expected, @"Wrong tile width");
}

- (void) testTileHeight
{
    NSInteger expected = 13;
    
    self.layout.tileHeight = expected;
    
    STAssertEquals(self.layout.tileHeight, expected, @"Wrong tile height");
}

@end
