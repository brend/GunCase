//
//  GCMapTilesetTest.m
//  GunCase
//
//  Created by Philipp Brendel on 15.08.12.
//
//

#import "GCMapTilesetTest.h"
#import "GCMapTileset.h"

@implementation GCMapTilesetTest

- (void) testName
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    
    tileset.name = @"Foo";
    
    STAssertEqualObjects(@"Foo", tileset.name, @"Wrong name");
}

- (void) testTileWidth
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    NSInteger tileWidth = 17;
    
    tileset.tileWidth = tileWidth;
    
    STAssertEquals(tileWidth, tileset.tileWidth, @"Wrong tile width");
}

- (void) testTileHeight
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    NSInteger tileHeight = 4;
    
    tileset.tileHeight = tileHeight;
    
    STAssertEquals(tileHeight, tileset.tileHeight, @"Wrong tile height");
}

- (void) testFirstID
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    NSInteger firstID = 42;
    
    tileset.firstID = firstID;
    
    STAssertEquals(firstID, tileset.firstID, @"Wrong first ID");
}

- (void) testSetImage
{
    NSLog(@"testSetImage not implemented");
}

- (void) testTileOffset
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    NSSize tileOffset = NSMakeSize(17, 4);
    
    tileset.tileOffset = tileOffset;
    
    STAssertEquals(tileOffset, tileset.tileOffset, @"Wrong tile offset");
}

- (void) testAddTile
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    GCMapTile *tile = [[GCMapTile alloc] initWithSprite: nil];
    
    [tileset addTile: tile];
}

- (void) testTileWithID
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    GCMapTile
        *tile17 = [[GCMapTile alloc] initWithSprite: nil],
        *tile18 = [[GCMapTile alloc] initWithSprite: nil];
    
    tileset.firstID = 17;
    [tileset addTile: tile17];
    [tileset addTile: tile18];
    
    // TODO: Implement equality on tiles? The tile will be cloned???
    
    STAssertEqualObjects(tile18, [tileset tileWithID: 18], @"Wrong tile");
}

- (void) testTileAtIndex
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    GCMapTile
        *tile17 = [[GCMapTile alloc] initWithSprite: nil],
        *tile18 = [[GCMapTile alloc] initWithSprite: nil];
    
    tileset.firstID = 17;
    [tileset addTile: tile17];
    [tileset addTile: tile18];
    
    // TODO: Implement equality on tiles? The tile will be cloned???
    
    STAssertEqualObjects(tile18, [tileset tileAtIndex: 1], @"Wrong tile");
}

- (void) testTileCount
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    GCMapTile
        *tile17 = [[GCMapTile alloc] initWithSprite: nil],
        *tile18 = [[GCMapTile alloc] initWithSprite: nil];
    NSInteger expectedTileCount = 2;
    
    tileset.firstID = 17;
    [tileset addTile: tile17];
    [tileset addTile: tile18];
    
    STAssertEquals(expectedTileCount, tileset.tileCount, @"Wrong tile count");
}

- (void) testCopy
{
    GCMapTileset *tileset = [[GCMapTileset alloc] init];
    
    tileset.name = @"Das Set";
    tileset.tileWidth = 17;
    tileset.tileHeight = 4;
    tileset.firstID = 21;
    tileset.tileOffset = NSMakeSize(13, 22);
    [tileset addTile: [GCMapTile emptyTile]];
    
    GCMapTileset *copy = [tileset copy];
    
    STAssertNotNil(copy, @"Copy is nil");
    STAssertEqualObjects(copy.name, tileset.name, @"Names differ");
    STAssertEquals(copy.tileWidth, tileset.tileWidth, @"Tile widths differ");
    STAssertEquals(copy.tileHeight, tileset.tileHeight, @"Tile heights differ");
    STAssertEquals(copy.firstID, tileset.firstID, @"First IDs differ");
    STAssertEquals(copy.tileOffset, tileset.tileOffset, @"Tile offsets differ");
    STAssertEquals(copy.tileCount, tileset.tileCount, @"Tile counts differ");
}

@end
