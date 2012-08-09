//
//  GCTiledMapBase64Decoder.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>
#import "GCMapLayerDataDecoder.h"

@interface GCTiledMapBase64Decoder : NSObject <GCMapLayerDataDecoder>

- (NSData *) decode: (NSString *) text;

@end
