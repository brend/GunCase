//
//  GCMapTileset.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMapTile.h"

@interface GCMapTileset : NSObject <NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger tileWidth, tileHeight, firstID;

- (void) setImage: (NSImage *) image;
@property (nonatomic) NSSize tileOffset;

- (void) addTile: (GCMapTile *) tile;
- (GCMapTile *) tileWithID: (NSInteger) identifier;
- (GCMapTile *) tileAtIndex: (NSInteger) index;
@property (nonatomic, readonly) NSInteger tileCount;

@end
