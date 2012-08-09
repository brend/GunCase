//
//  GCMapTileset.m
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import "GCMapTileset.h"
#import "NSImage+PowersOf2.h"

@interface GCMapTileset ()
@property (nonatomic, strong) NSMutableArray *tiles;
@end

@implementation GCMapTileset

- (id)init
{
    self = [super init];
    if (self) {
        self.tiles = [NSMutableArray array];
    }
    return self;
}

- (id) copyWithZone:(NSZone *)zone
{
    GCMapTileset *copy = [[GCMapTileset allocWithZone: zone] init];
    
    copy.name = [self.name copy];
    copy.tileWidth = self.tileWidth;
    copy.tileHeight = self.tileHeight;
    copy.tileOffset = self.tileOffset;
    copy.firstID = self.firstID;
    copy.tiles = [[NSMutableArray alloc] initWithArray: self.tiles copyItems: YES];
    
    return copy;
}

- (void) setImage:(NSImage *)image
{
    if (image == nil)
        return;
    
    NSInteger
        width = image.size.width,
        height = image.size.height;
    NSInteger
        cols = width / self.tileWidth,
        rows = height / self.tileHeight;
    NSImage *embiggenedImage = [image imageByResizingToPowersOf2];
    NSArray *sprites =
        [GCSprite spritesWithSheet: embiggenedImage
                             width: width
                            height: height
                           columns: cols
                              rows: rows];    
    NSMutableArray *a = [NSMutableArray arrayWithCapacity: sprites.count];
    NSInteger globalID = self.firstID;
    
    // TODO: Move GCMapTile instantiation away from here
    for (GCSprite *s in sprites) {
        GCMapTile *t = [[GCMapTile alloc] initWithSprite: s];
        
        t.globalID = globalID++;
        
        [a addObject: t];
    }
    
    self.tiles = a;
}

- (GCMapTile *) tileWithID: (NSInteger) identifier
{
    if (!NSLocationInRange(identifier, NSMakeRange(self.firstID, self.tileCount)))
        return nil;
    
    NSInteger index = identifier - self.firstID;
    
    return [self tileAtIndex: index];
}

- (GCMapTile *) tileAtIndex: (NSInteger) index
{
    GCMapTile *prototype = [self.tiles objectAtIndex: index];
    
    return [prototype copy];
}

- (NSInteger) tileCount
{
    return self.tiles.count;
}

- (void) addTile: (GCMapTile *) tile
{
    [self.tiles addObject: tile];
}

@end
