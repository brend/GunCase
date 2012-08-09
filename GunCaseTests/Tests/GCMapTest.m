//
//  GCMapTest.m
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import "GCMapTest.h"
#import "GCMap.h"

@implementation GCMapTest

- (void) testAddLayer
{
    GCMap *map = [[GCMap alloc] init];
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    
    [map addLayer: layer];
}

- (void) testTopmostLayer
{
    GCMap *map = [[GCMap alloc] init];
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    
    [map addLayer: layer];
    
    STAssertEqualObjects(layer, map.topmostLayer, @"Added layer not on top");
}

- (void) testLayerAtIndex
{
    GCMap *map = [[GCMap alloc] init];
    GCMapLayer
        *layer0 = [[GCMapLayer alloc] init],
        *layer1 = [[GCMapLayer alloc] init];
    
    [map addLayer: layer0];
    [map addLayer: layer1];
    
    STAssertEqualObjects(layer0, [map layerAtIndex: 0], @"Wrong layer returned");
    STAssertEqualObjects(layer1, [map layerAtIndex: 1], @"Wrong layer returned");
}

- (void) testLayerCount
{
    GCMap *map = [[GCMap alloc] init];
    GCMapLayer
        *layer0 = [[GCMapLayer alloc] init],
        *layer1 = [[GCMapLayer alloc] init];
    NSInteger expectedLayerCount = 2;
    
    [map addLayer: layer0];
    [map addLayer: layer1];
    
    STAssertEquals(expectedLayerCount, map.layerCount, @"Wrong layer count");
}

- (void) testAddTileset
{
    GCMap *map = [[GCMap alloc] init];
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    
    [map addTileset: tileset];
}

- (void) testTilesetAtIndex
{
    GCMap *map = [[GCMap alloc] init];
    GCMapTileset
        *tileset0 = [[GCMapTileset alloc] init],
        *tileset1 = [[GCMapTileset alloc] init];
    
    [map addTileset: tileset0];
    [map addTileset: tileset1];
    
    STAssertEqualObjects(tileset0, [map tilesetAtIndex: 0], @"Wrong tileset returned");
    STAssertEqualObjects(tileset1, [map tilesetAtIndex: 1], @"Wrong tileset returnd");
}

- (void) testTilesetCount
{
    GCMap *map = [[GCMap alloc] init];
    GCMapTileset
        *tileset0 = [[GCMapTileset alloc] init],
        *tileset1 = [[GCMapTileset alloc] init];
    NSInteger expectedTilesetCount = 2;
    
    [map addTileset: tileset0];
    [map addTileset: tileset1];
    
    STAssertEquals(expectedTilesetCount, map.tilesetCount, @"Wrong tileset count");
}

- (void) testTileWithID
{
    GCMap *map = [[GCMap alloc] init];
    GCMapTileset
        *tileset0 = [[GCMapTileset alloc] init],
        *tileset1 = [[GCMapTileset alloc] init];
    GCMapTile *tile = [[GCMapTile alloc] initWithSprite: nil];
    
    [map addTileset: tileset0];
    [map addTileset: tileset1];
    
    tileset0.firstID = 1;
    [tileset0 addTile: [[GCMapTile alloc] initWithSprite: nil]];
    tileset1.firstID = 2;
    [tileset1 addTile: tile];
    
    GCMapTile *returnedTile = [map tileWithID: 2];
    
    STAssertEqualObjects(tile, returnedTile, @"Wrong tile returned");
}

- (void) testVersion
{
    GCMap *map = [[GCMap alloc] init];
    NSString *version = @"1.17";
    
    map.version = version;
    
    STAssertEqualObjects(map.version, version, @"Wrong version");
}

- (void) testOrientation
{
    GCMap *map = [[GCMap alloc] init];
    NSString *orientation = @"isometric";
    
    map.orientation = orientation;
    
    STAssertEqualObjects(map.orientation, orientation, @"Wrong orientation");
}

- (void) testWidth
{
    GCMap *map = [[GCMap alloc] init];
    NSInteger width = 17;
    
    map.width = width;
    
    STAssertEquals(map.width, width, @"Wrong width");
}

- (void) testHeight
{
    GCMap *map = [[GCMap alloc] init];
    NSInteger height = 17;
    
    map.height = height;
    
    STAssertEquals(map.height, height, @"Wrong height");
}

- (void) testTileWidth
{
    GCMap *map = [[GCMap alloc] init];
    NSInteger tileWidth = 17;
    
    map.tileWidth = tileWidth;
    
    STAssertEquals(map.tileWidth, tileWidth, @"Wrong tile width");
}

- (void) testTileHeight
{
    GCMap *map = [[GCMap alloc] init];
    NSInteger tileHeight = 17;
    
    map.tileHeight = tileHeight;
    
    STAssertEquals(map.tileHeight, tileHeight, @"Wrong tile height");
}

- (void) testCopy
{
    GCMap *map = [[GCMap alloc] init];
    GCMapLayer *layer = [[GCMapLayer alloc] init];
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    
    map.version = @"Furunkeltown";
    map.orientation = @"orthogonal";
    map.width = 17;
    map.height = 4;
    map.tileWidth = 21;
    map.tileHeight = 42;
    [map addLayer: layer];
    [map addTileset: tileset];
    
    GCMap *copy = [map copy];
    
    STAssertEqualObjects(copy.version, map.version, @"Wrong version");
    STAssertEqualObjects(copy.orientation, map.orientation, @"Wrong orientation");
    STAssertEquals(copy.width, map.width, @"Wrong width");
    STAssertEquals(copy.height, map.height, @"Wrong height");
    STAssertEquals(copy.tileWidth, map.tileWidth, @"Wrong tile width");
    STAssertEquals(copy.tileHeight, map.tileHeight, @"Wrong tile height");
    STAssertTrue(copy.layerCount == 1, @"Wrong number of layers");
    STAssertTrue(copy.tilesetCount == 1, @"Wrong number of tilesets");
}

@end
