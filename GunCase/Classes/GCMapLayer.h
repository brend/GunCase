//
//  GCMapLayer.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCCompositeActor.h"
#import "GCMapParserScopeTarget.h"
#import "GCMapTile.h"
#import "GCMapLayout.h"

@interface GCMapLayer : GCCompositeActor <NSCopying, GCMapParserScopeTarget>

#pragma mark -
#pragma mark Initialization

+ (id) layer;

#pragma mark -
#pragma mark Layer Properties

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger width, height;

@property (nonatomic, copy) NSDictionary *attributes;

@property (nonatomic, strong) GCMapLayout *layout;

#pragma mark -
#pragma mark Managing Tiles

- (void) addTile: (GCMapTile *) tile;
- (NSInteger) tileCount;
@property (nonatomic) NSInteger tileWidth, tileHeight;
- (GCMapTile *) tileAtX: (NSInteger) x y: (NSInteger) y;

@end
