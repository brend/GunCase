//
//  GCMapLayout.h
//  GunCase
//
//  Created by Philipp Brendel on 26.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCVector.h"

@interface GCMapLayout : NSObject

@property (nonatomic) NSInteger width, height, tileWidth, tileHeight;
@property (nonatomic) NSInteger tileIndex;

- (GCVector *) next;

@end
