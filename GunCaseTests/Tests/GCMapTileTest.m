//
//  GCMapTileTest.m
//  GunCase
//
//  Created by Philipp Brendel on 15.08.12.
//
//

#import "GCMapTileTest.h"
#import "GCMapTile.h"

@implementation GCMapTileTest

- (void) testInitWithSprite
{
    GCMapTile *tile = [[GCMapTile alloc] initWithSprite: nil];
    
    STAssertNotNil(tile, @"Alloced tile is nil");
}

- (void) testGlobalID
{
    GCMapTile *tile = [[GCMapTile alloc] initWithSprite:nil];
    NSInteger globalID = 17;
    
    tile.globalID = globalID;
    
    STAssertEquals(tile.globalID, globalID, @"Wrong global ID");
}

- (void) testIsEqual
{
    GCMapTile
        *tileA = [[GCMapTile alloc] initWithSprite:nil],
        *tileB = [[GCMapTile alloc] initWithSprite: nil];
    NSInteger globalID = 17;
    
    tileA.globalID = globalID;
    tileB.globalID = globalID;
    
    STAssertEqualObjects(tileA, tileB, @"Tiles with same ID are not equal");
}

- (void) testCopy
{
    GCMapTile *tile = [[GCMapTile alloc] initWithSprite: nil];
    
    tile.globalID = 17;
    
    GCMapTile *copy = [tile copy];
    
    STAssertEqualObjects(copy, tile, @"Copy does not equal original object");
}

- (void) testEmptyTile
{
    STAssertNotNil([GCMapTile emptyTile], @"Empty tile is nil");
}

@end
