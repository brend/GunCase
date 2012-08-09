//
//  GCTiledMapBase64Decoder.m
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import "GCTiledMapBase64Decoder.h"
#import "NSData+Base64.h"

@implementation GCTiledMapBase64Decoder

- (NSData *) decode: (NSString *) text
{
    return [NSData decodeBase64WithString: text];
}

@end
