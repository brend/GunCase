//
//  GCMapParser.h
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMap.h"
#import "GCMapParserScope.h"

@interface GCMapParser : NSObject

- (BOOL) parse;

@property (nonatomic, strong) GCMap *map;

@property (nonatomic, strong) id
    mapPrototype,
    layerPrototype,
    objectLayerPrototype,
    tilesetPrototype,
    tilePrototype;

#pragma mark -
#pragma mark Map Construction
- (GCMap *) createMap;
- (void) finalizeMap;

- (GCMapLayer *) addLayer;
- (void) finalizeLayer;

- (GCMapObjectLayer *) addObjectLayer;
- (void) finalizeObjectLayer;

- (GCMapTileset *) addTileset;
- (void) setTilesetImage: (NSImage *) image;
- (void) finalizeTileset;

- (void) addTileOffset: (NSSize) offset;
- (GCMapTile *) addTileWithID: (NSInteger) identifier;

- (void) beginAttributes;
- (void) addAttribute: (NSDictionary *) attributeInfo;
- (void) applyAttributes;

#pragma mark -
#pragma mark Element Scope
@property (nonatomic, readonly) GCMapParserScope *currentScope;
- (void) pushScopeNamed: (NSString *) name target: (id<GCMapParserScopeTarget>) target;
- (void) popScope;

@end
