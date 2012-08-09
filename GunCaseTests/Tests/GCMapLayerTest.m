//
//  GCMapLayerTest.m
//  GunCase
//
//  Created by Philipp Brendel on 15.08.12.
//
//

#import "GCMapLayerTest.h"
#import "GCMapLayer.h"

@implementation GCMapLayerTest

- (void) testLayer
{
    STAssertNotNil([GCMapLayer layer], @"nil has been returned");
}

- (void) testName
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSString *name = @"The Background";
    
    layer.name = name;
    
    STAssertEqualObjects(layer.name, name, @"Wrong name");
}

- (void) testWidth
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSInteger width = 17;
    
    layer.width = width;
    
    STAssertEquals(layer.width, width, @"Wrong width");
}

- (void) testHeight
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSInteger height = 18;
    
    layer.height = height;
    
    STAssertEquals(layer.height, height, @"Wrong height");
}

- (void) testTileWidth
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSInteger tileWidth = 17;
    
    layer.tileWidth = tileWidth;
    
    STAssertEquals(layer.tileWidth, tileWidth, @"Wrong tile width");
}

- (void) testTileHeight
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSInteger tileHeight = 17;
    
    layer.tileHeight = tileHeight;
    
    STAssertEquals(layer.tileHeight, tileHeight, @"Wrong tile height");
}

- (void) testAddTile
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    
    layer.width = 100;
    layer.height = 100;
    layer.tileWidth = 32;
    layer.tileHeight = 32;
    
    [layer addTile: [[GCMapTile alloc] initWithSprite: nil]];
}

- (void) testTileCount
{
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    NSInteger expectedTileCount = 1;
    
    layer.width = 100;
    layer.height = 100;
    layer.tileWidth = 32;
    layer.tileHeight = 32;
    
    [layer addTile: [[GCMapTile alloc] initWithSprite: nil]];
    
    STAssertEquals(layer.tileCount, expectedTileCount, @"Wrong tile count");
}

@end
