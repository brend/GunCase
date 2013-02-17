//
//  GCMapParser.h
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMap.h"

@interface GCMapParser : NSObject

- (BOOL) parse;

@property (nonatomic, strong) GCMap *map;

@property (nonatomic, strong) id
    mapPrototype,
    layerPrototype,
    tilesetPrototype,
    tilePrototype;

#pragma mark -
#pragma mark Map Construction
- (GCMap *) createMap;
@property (nonatomic, copy) NSDictionary *mapProperties;
- (GCMapLayer *) addLayer;
@property (nonatomic, copy) NSDictionary *layerProperties;
- (GCMapTileset *) addTileset;
- (void) setTilesetImage: (NSImage *) image;
- (void) addTileOffset: (NSSize) offset;
- (GCMapTile *) addTileWithID: (NSInteger) identifier;

@end
