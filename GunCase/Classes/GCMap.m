//
//  GCMap.m
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import "GCMap.h"
#import "GCOrthogonalMapLayout.h"
#import "GCIsometricMapLayout.h"

@interface GCMap ()
@property (nonatomic, strong) NSMutableArray *layers;
@property (nonatomic, strong) NSMutableArray *tilesets;

- (GCMapLayout *) createMapLayoutStrategy;
@end

@implementation GCMap

#pragma mark -
#pragma mark Initialization

- (id) init
{
    self = [super init];
    if (self) {
        self.layers = [NSMutableArray array];
        self.tilesets = [NSMutableArray array];
    }
    return self;
}

- (id) copyWithZone:(NSZone *)zone
{
    GCMap *copy = [[GCMap allocWithZone: zone] init];
    
    copy.version = [self.version copy];
    copy.orientation = [self.orientation copy];
    copy.width = self.width;
    copy.height = self.height;
    copy.tileWidth = self.tileWidth;
    copy.tileHeight = self.tileHeight;
    
    copy.layers = [[NSMutableArray alloc] initWithArray:self.layers copyItems: YES];
    copy.tilesets = [[NSMutableArray alloc] initWithArray: self.tilesets copyItems: YES];
    
    return copy;
}

#pragma mark -
#pragma mark Managing Tilesets

- (void) addTileset: (GCMapTileset *) tileset
{
    [self.tilesets addObject: tileset];
}

- (NSInteger) tilesetCount
{
    return self.tilesets.count;
}

- (GCMapTileset *) tilesetAtIndex: (NSInteger) index
{
    return [self.tilesets objectAtIndex: index];
}

- (GCMapTile *) tileWithID: (NSInteger) identifier
{
    // TODO: Instantiate map tile elsewhere
    if (identifier == 0) {
        return [GCMapTile emptyTile];
    }
    
    GCMapTile *tile = nil;
        
    for (GCMapTileset *tileset in self.tilesets) {
        tile = [tileset tileWithID: identifier];
        
        if (tile)
            return tile;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Managing Layers

- (void) addLayer: (GCMapLayer *) layer
{
    [self.layers addObject: layer];
    [self addComponent: layer];
    
    // Propagate map information
    layer.layout = [self createMapLayoutStrategy];
}

- (GCMapLayer *) topmostLayer
{
    return self.layers.lastObject;
}

- (GCMapLayer *) layerAtIndex:(NSInteger)index
{
    return [self.layers objectAtIndex: index];
}

- (GCMapLayer *) layerNamed: (NSString *) name
{
    for (GCMapLayer *layer in self.layers) {
        if ([layer.name isEqualToString: name])
            return layer;
    }
    
    return nil;
}

- (NSInteger) layerCount
{
    return self.layers.count;
}

- (void) addTile:(GCMapTile *)tile
{
    [self.topmostLayer addTile: tile];
}

- (GCMapLayout *) createMapLayoutStrategy
{
    GCMapLayout *layout = [self.orientation isEqualToString: @"isometric"]
        ? [[GCIsometricMapLayout alloc] init]
        : [[GCOrthogonalMapLayout alloc] init];
    
    layout.width = self.width;
    layout.height = self.height;
    // TODO: Does the layout rather need the layer's tile{Width,Height}? What's the difference?
    layout.tileWidth = self.tileWidth;
    layout.tileHeight = self.tileHeight;
    
    return layout;
}

@end
