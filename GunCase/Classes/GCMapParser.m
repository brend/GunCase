//
//  GCMapParser.m
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import "GCMapParser.h"
#import "GCStack.h"
#import "GCMapParserScope.h"

@interface GCMapParser ()
@property (nonatomic, strong) GCStack *scopeStack;
@property (nonatomic, readonly) GCMapParserScope *currentScope;
@end

// A base class for map parsers
@implementation GCMapParser

- (BOOL) parse
{
    @throw [NSException exceptionWithName: @"AbstractMethod" reason: @"Must be implemented by subclass" userInfo: nil];
}

#pragma mark -
#pragma mark Map Construction

- (GCMap *) createMap
{
    return self.map = [self instantiateMap];
}

- (GCMapLayer *) addLayer
{
    GCMapLayer *layer = [self instantiateLayer];
    
    [self.map addLayer: layer];
    
    return layer;
}

- (GCMapTileset *) addTileset
{
    GCMapTileset *tileset = [self instantiateTileset];
    
    [self.map addTileset: tileset];
    
    return tileset;
}

- (void) setTilesetImage:(NSImage *)image
{
    if (self.map.tilesetCount == 0) {
        NSLog(@"Can't set image: There are not tilesets.");
        return;
    }
    
    NSInteger index = self.map.tilesetCount - 1;
    GCMapTileset *tileset = [self.map tilesetAtIndex: index];
    
    [tileset setImage: image];
}

- (void) addTileOffset:(NSSize)offset
{
    if (self.map.tilesetCount == 0) {
        NSLog(@"Can't set tile offset: There are no tilesets.");
        return;
    }
    
    NSInteger index = self.map.tilesetCount - 1;
    GCMapTileset *tileset = [self.map tilesetAtIndex: index];
    
    tileset.tileOffset = offset;
}

- (GCMapTile *) addTileWithID:(NSInteger)identifier
{
    // NOTE: If the map returns the tile, why bother with the protoypes?
    // Maybe just demand a map prototype?
    GCMapTile *tile = [self.map tileWithID: identifier];
    
    if (tile == nil) {
        NSLog(@"Can't find tile with id: %ld", identifier);
        return nil;
    }
    
    GCMapLayer *layer = self.map.topmostLayer;
    
    [layer addTile: tile];
    
    return tile;
}

#pragma mark -
#pragma mark Prototype Instantiation

- (GCMap *) instantiateMap
{
    return self.mapPrototype?
          [self.mapPrototype copy]
        : [[GCMap alloc] init];
}

- (GCMapLayer *) instantiateLayer
{
    return self.layerPrototype?
          [self.layerPrototype copy]
        : [[GCMapLayer alloc] init];
}

- (GCMapTileset *) instantiateTileset
{
    return self.tilesetPrototype?
        [self.tilesetPrototype copy]
      : [[GCMapTileset alloc] init];
}

@end
