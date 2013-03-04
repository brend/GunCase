//
//  GCMap.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCCompositeActor.h"
#import "GCMapParserScopeTarget.h"
#import "GCMapLayer.h"
#import "GCMapObjectLayer.h"
#import "GCMapTileset.h"

@interface GCMap : GCCompositeActor <NSCopying, GCMapParserScopeTarget>

#pragma mark -
#pragma mark Managing Layers

- (void) addLayer: (GCMapLayer *) layer;
@property (readonly) GCMapLayer *topmostLayer;
- (GCMapLayer *) layerAtIndex: (NSInteger) index;
- (GCMapLayer *) layerNamed: (NSString *) name;
- (NSInteger) layerCount;

#pragma mark -
#pragma mark Managing Tilesets

- (void) addTileset: (GCMapTileset *) tileset;
- (NSInteger) tilesetCount;
- (GCMapTileset *) tilesetAtIndex: (NSInteger) index;
- (GCMapTile *) tileWithID: (NSInteger) identifier;

#pragma mark -
#pragma mark Map Properties

@property (nonatomic, copy) NSString *version, *orientation;
@property (nonatomic)  NSInteger width, height, tileWidth, tileHeight;
@property (nonatomic, copy) NSDictionary *attributes;

@end
