//
//  GCIsometricMapLayout.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCIsometricMapLayout.h"

@interface GCIsometricMapLayout ()
@property (nonatomic) float tileX, tileY;
@end

@implementation GCIsometricMapLayout

- (GCVector *) currentPosition
{
    if (self.tileIndex % self.width == 0) {
        self.tileX = 0 - (self.tileIndex / self.width) * self.tileWidth / 2;
        self.tileY = 0 - (self.tileIndex / self.width) * self.tileHeight / 2;
    } else {
        self.tileX += self.tileWidth / 2;
        self.tileY -= self.tileHeight / 2;
    }
    
    return [GCVector vectorWithX: self.tileX y: self.tileY];
}

@end
