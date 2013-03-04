//
//  GCMapTileset.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMapParserScopeTarget.h"
#import "GCMapTile.h"

@interface GCMapTileset : NSObject <NSCopying, GCMapParserScopeTarget>

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger tileWidth, tileHeight, firstID;
@property (nonatomic, strong) NSDictionary *attributes;

- (void) setImage: (NSImage *) image;
@property (nonatomic) NSSize tileOffset;

- (void) addTile: (GCMapTile *) tile;
- (GCMapTile *) tileWithID: (NSInteger) identifier;
- (GCMapTile *) tileAtIndex: (NSInteger) index;
@property (nonatomic, readonly) NSInteger tileCount;

@end
