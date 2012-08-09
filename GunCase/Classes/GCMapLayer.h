//
//  GCMapLayer.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCCompositeActor.h"
#import "GCMapTile.h"

@interface GCMapLayer : GCCompositeActor <NSCopying>

#pragma mark -
#pragma mark Initialization

+ (id) layer;

#pragma mark -
#pragma mark Layer Properties

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger width, height;

#pragma mark -
#pragma mark Managing Tiles

- (void) addTile: (GCMapTile *) tile;
- (NSInteger) tileCount;
@property (nonatomic) NSInteger tileWidth, tileHeight;

@end
