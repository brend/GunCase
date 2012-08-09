//
//  GCMapTile.m
//  GunCase
//
//  Created by Philipp Brendel on 10.08.12.
//
//

#import "GCMapTile.h"

@implementation GCMapTile

- (id) initWithSprite:(GCSprite *)sprite
{
    self = [super initWithSprite: sprite];
    
    return self;
}

+ (id) emptyTile
{
    return [[GCMapTile alloc] initWithSprite: nil];
}

- (id) copyWithZone:(NSZone *)zone
{
    GCMapTile *copy =
        [[GCMapTile allocWithZone: zone] initWithSprite: self.sprite];
    
    copy.globalID = self.globalID;
    
    return copy;
}

- (BOOL) isEqual:(id)object
{
    return self.globalID == [object globalID];
}

@end
