//
//  GCMapParser.m
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import "GCMapParser.h"
#import "GCStack.h"

@interface GCMapParser ()
@property (nonatomic, strong) GCStack *scopeStack;
@property (nonatomic, strong) NSMutableDictionary *currentAttributes;
@end

// A base class for map parsers
@implementation GCMapParser

#pragma mark -
#pragma mark Initialization and Deallocation

- (id)init
{
    self = [super init];
    if (self) {
        self.scopeStack = [[GCStack alloc] init];
    }
    return self;
}

- (void)dealloc
{
    self.scopeStack = nil;
    self.currentAttributes = nil;
}

#pragma mark -
#pragma mark Starting the Parsing

- (BOOL) parse
{
    @throw [NSException exceptionWithName: @"AbstractMethod" reason: @"Must be implemented by subclass" userInfo: nil];
}

#pragma mark -
#pragma mark Map Construction

- (GCMap *) createMap
{
    self.map = [self instantiateMap];
    
    [self pushScopeNamed: @"map" target: self.map];
    
    return self.map;
}

- (void) finalizeMap
{
    [self finalizeScope: @"map"];
}

- (void) finalizeScope: (NSString *) scopeToBeFinalized
{
    GCMapParserScope *scope = self.currentScope;
    
    if (scope == nil)
        @throw [NSException exceptionWithName: @"MissingScope" reason: @"There is no scope that can be finalized" userInfo:nil];
    
    if (![scope.name isEqualToString: scopeToBeFinalized]) {
        NSDictionary *ui = [NSDictionary dictionaryWithObjectsAndKeys:
                            scopeToBeFinalized, @"scopeToBeFinalized",
                            self.currentScope.name, @"currentScope",
                            nil];
        @throw [NSException exceptionWithName: @"ScopeMismatch"
                                       reason: @"The scope type to be finalized doesn't match the type of the current scope"
                                     userInfo: ui];
    }
    
    [self popScope];
}

- (GCMapLayer *) addLayer
{
    GCMapLayer *layer = [self instantiateLayer];
    
    [self.map addLayer: layer];
    
    [self pushScopeNamed: @"layer" target: layer];
    
    return layer;
}

- (void) finalizeLayer
{
    [self finalizeScope: @"layer"];
}

- (GCMapObjectLayer *) addObjectLayer
{
    GCMapObjectLayer *objectLayer = [self instantiateObjectLayer];
    
    [self.map addLayer: objectLayer];
    
    [self pushScopeNamed: @"objectLayer" target: objectLayer];
    
    return objectLayer;
}

- (void) finalizeObjectLayer
{
    [self finalizeScope: @"objectLayer"];
}

- (GCMapTileset *) addTileset
{
    GCMapTileset *tileset = [self instantiateTileset];
    
    [self.map addTileset: tileset];
    
    [self pushScopeNamed: @"tileset" target: tileset];
    
    return tileset;
}

- (void) finalizeTileset
{
    [self finalizeScope: @"tileset"];
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

- (void) beginAttributes
{
    self.currentAttributes = [NSMutableDictionary dictionary];
}

- (void) addAttribute: (NSDictionary *) attributes
{
    NSString
        *name = [attributes objectForKey: @"name"],
        *value = [attributes objectForKey: @"value"];
    
    if (name == nil || value == nil)
        @throw [NSException exceptionWithName: @"InvalidArgument" reason: @"Attributes 'name' and 'value' mustn't be nil" userInfo: nil];
    
    [self.currentAttributes setObject: value forKey: name];
}

- (void) applyAttributes
{
    GCMapParserScope *scope = self.currentScope;
    
    [scope setAttributes: self.currentAttributes];
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

- (GCMapObjectLayer *) instantiateObjectLayer
{
    return self.objectLayerPrototype?
          [self.objectLayerPrototype copy]
        : [[GCMapObjectLayer alloc] init];
}

- (GCMapTileset *) instantiateTileset
{
    return self.tilesetPrototype?
        [self.tilesetPrototype copy]
      : [[GCMapTileset alloc] init];
}

#pragma mark -
#pragma mark Map Element Scope

- (void) pushScopeNamed: (NSString *) name
                 target: (id<GCMapParserScopeTarget>) target
{
    GCMapParserScope *scope = [GCMapParserScope scopeWithTarget: target name: name];
    
    [self.scopeStack push: scope];
}

- (void) popScope
{
    [self.scopeStack pop];
}

- (GCMapParserScope *) currentScope
{
    return [self.scopeStack peek];
}

@end
