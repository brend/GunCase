//
//  GCGzipDecompressor.h
//  TheUnzipper
//
//  Created by Philipp Brendel on 17.08.12.
//  Copyright (c) 2012 Philipp Brendel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCMapLayerDataDecompressor.h"

@interface GCTiledMapGzipDecompressor : NSObject <GCMapLayerDataDecompressor>
- (NSData *) decompress: (NSData *) compressedData;
@end
