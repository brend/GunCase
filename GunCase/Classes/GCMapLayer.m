//
//  GCMapLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import "GCMapLayer.h"

@interface GCMapLayer ()
@property (nonatomic, strong) NSMutableArray *tiles;
// Building the layer
@property (nonatomic) NSInteger nextTileIndex;
@property (nonatomic) float nextTileX, nextTileY;
@end

@implementation GCMapLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.tiles = [NSMutableArray array];
    }
    return self;
}

+ (id) layer
{
    return [[GCMapLayer alloc] init];
}

- (id) copyWithZone:(NSZone *)zone
{
    GCMapLayer *copy = [[GCMapLayer allocWithZone: zone] init];
    
    copy.name = [self.name copy];
    copy.width = self.width;
    copy.height = self.height;
    copy.tileWidth = self.tileWidth;
    copy.tileHeight = self.tileHeight;
    copy.tiles = [[NSMutableArray alloc] initWithArray:self.tiles copyItems: YES];
    
    return copy;
}

#pragma mark -
#pragma mark Managing Tiles

- (void) addTile: (GCMapTile *) tile
{    
    GCVector *p = [self.layout next];
    
    tile.position = p;
    
    [self.tiles addObject: tile];
    [self addComponent: tile];
}
                           
- (NSInteger) tileCount
{
    return self.tiles.count;
}

- (GCMapTile *) tileAtX: (NSInteger) x y: (NSInteger) y
{
    NSAssert(x >= 0 && x < self.width, @"Invalid x coordinate");
    NSAssert(y >= 0 && y < self.height, @"Invalid y coordinate");
    
    return [self.tiles objectAtIndex: x + (self.height - (y + 1)) * self.width];
}

@end
