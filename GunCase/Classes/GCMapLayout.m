//
//  GCMapLayout.m
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import "GCMapLayout.h"

@implementation GCMapLayout

- (GCVector *) next
{
    GCVector *position = [self currentPosition];
    
    self.tileIndex += 1;
    
    return position;
}

- (GCVector *) currentPosition
{
    @throw [NSException exceptionWithName: @"AbstractMethod" reason: @"Must be implemented by subclass" userInfo: nil];
}

@end
