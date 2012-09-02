//
//  GDMapScene.m
//  GunCase
//
//  Created by Philipp Brendel on 12.08.12.
//
//

#import "GDMapScene.h"
#import "GCTiledMapParser.h"
#import "GCFont.h"

@interface GDMapScene ()
@property (nonatomic, strong) GCActor *text;
@end

@implementation GDMapScene

- (id)init
{
    self = [super init];
    if (self) {
        if (![self loadMap])
            return nil;
        
        [self createText];
    }
    return self;
}

- (void) render
{
    [super render];
    [self.map render];
    [self.text render];
}

- (void) update
{
    if ([self.keyboard keyPressed: 123]) {
        self.position = [self.position add: [GCVector vectorWithX: 2 y: 0]];
    }
    
    if ([self.keyboard keyPressed: 124]) {
        self.position = [self.position add: [GCVector vectorWithX: -2 y: 0]];
    }
    
    if ([self.keyboard keyPressed: 125]) {
        self.position = [self.position add: [GCVector vectorWithX: 0 y: 2]];
    }
    
    if ([self.keyboard keyPressed: 126]) {
        self.position = [self.position add: [GCVector vectorWithX: 0 y: -2]];
    }
}

- (BOOL) loadMap
{
    NSURL *mapURL = [[NSBundle bundleForClass: [GDMapScene class]] URLForResource:@"isometric_grass_and_water" withExtension: @"tmx"];
    
    if (mapURL == nil) {
        NSLog(@"Couldn't find map file in bundle");
        return NO;
    }
    
    GCTiledMapParser *parser = [[GCTiledMapParser alloc] initWithURL: mapURL];
    
    if ([parser parse]) {
        self.map = parser.map;
    } else {
        NSLog(@"Couldn't parse map file");
        return NO;
    }
    
    return YES;
}

- (void) createText
{
    GCFont *font = [[GCFont alloc] initWithImage: [NSImage imageNamed: @"font"] columns: 16 rows: 16];
    
    self.text = [font thingWithWordWrappedString: @"Use arrow keys to pan" inRect: NSMakeRect(0, 0, 14 * 16, 32)];
}

@end
