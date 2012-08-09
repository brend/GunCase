//
//  GCMapLayerDataDecompressor.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>

@protocol GCMapLayerDataDecompressor <NSObject>

- (NSData *) decompress: (NSData *) data;

@end
