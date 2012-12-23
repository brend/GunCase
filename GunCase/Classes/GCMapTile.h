//
//  GCMapTile.h
//  GunCase
//
//  Created by Philipp Brendel on 10.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCSpriteActor.h"

@interface GCMapTile : GCSpriteActor <NSCopying>

- (id) initWithSprite:(GCSprite *)sprite;

+ (id) emptyTile;

@property (nonatomic) NSInteger globalID;
@property (readonly) BOOL isEmpty;

@end
