//
//  GCIsometricMapLayout.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCIsometricMapLayout.h"

@interface GCIsometricMapLayout ()
@property (nonatomic) float tileX, tileY, originX, originY;
@property (nonatomic) BOOL originPrepared;
@end

@implementation GCIsometricMapLayout

- (GCVector *) currentPosition
{
    [self prepareOrigin];
    
    if (self.tileIndex % self.width == 0) {
        self.tileX = self.originX - (self.tileIndex / self.width) * self.tileWidth / 2;
        self.tileY = self.originY - (self.tileIndex / self.width) * self.tileHeight / 2;
    } else {
        self.tileX += self.tileWidth / 2;
        self.tileY -= self.tileHeight / 2;
    }
    
    return [GCVector vectorWithX: self.tileX y: self.tileY];
}

- (void) prepareOrigin
{
    if (self.originPrepared)
        return;
    
    // NOTE: x is left untouched; this might become a problem for non-square maps
    self.originX = 0;
    self.originY = self.height * (self.tileHeight - 1) / 2;
    
    self.originPrepared = YES;
}

@end
