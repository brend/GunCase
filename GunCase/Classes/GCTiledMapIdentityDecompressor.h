//
//  GCTiledMapIdentityDecompressor.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMapLayerDataDecompressor.h"

@interface GCTiledMapIdentityDecompressor : NSObject <GCMapLayerDataDecompressor>

- (NSData *) decompress: (NSData *) data;

@end
