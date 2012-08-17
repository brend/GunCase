//
//  GDMapScene.m
//  GunCase
//
//  Created by Philipp Brendel on 12.08.12.
//
//

#import "GDMapScene.h"
#import "GCTiledMapParser.h"

@implementation GDMapScene

- (id)init
{
    self = [super init];
    if (self) {
//        // NSURL *mapURL = [[NSBundle bundleForClass: [GDMapScene class]] URLForResource:@"zelda_map" withExtension: @"tmx"];
//        NSURL *mapURL = [[NSBundle bundleForClass: [GDMapScene class]] URLForResource:@"sewers_base64_uncompressed" withExtension: @"tmx"];
//        
//        NSAssert(mapURL, @"Invalid map url");
//        
//        GCTiledMapParser *parser = [[GCTiledMapParser alloc] initWithURL: mapURL];
//        
//        if ([parser parse]) {
//            self.map = parser.map;
//        } else {
//            NSLog(@"Couldn't parse map file");
//        }
//        
//        float
//            cx = (float) -self.map.width * self.map.tileWidth / 2,
//            cy = (float) -self.map.height * self.map.tileHeight / 2;
//        
//        self.position = [GCVector vectorWithX: cx y: cy];
    }
    return self;
}

- (void) render
{
    [super render];
    [self.map render];
}

- (void) update
{
    if ([self.keyboard keyPressed: 123]) {
        self.position = [self.position add: [GCVector vectorWithX: -1 y: 0]];
    }
    
    if ([self.keyboard keyPressed: 124]) {
        self.position = [self.position add: [GCVector vectorWithX: 1 y: 0]];
    }
}

@end