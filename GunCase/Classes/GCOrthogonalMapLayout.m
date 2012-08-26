//
//  GCOrthogonalMapLayout.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCOrthogonalMapLayout.h"

@implementation GCOrthogonalMapLayout

- (GCVector *) currentPosition
{
    return [GCVector vectorWithX: (self.tileIndex % self.width) * self.tileWidth
                               y: (self.height - self.tileIndex / self.width) * self.tileHeight];
}

@end
