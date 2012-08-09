//
//  GCMapLayerDataDecoder.h
//  GunCase
//
//  Created by Philipp Brendel on 09.08.12.
//
//

#import <Foundation/Foundation.h>

@protocol GCMapLayerDataDecoder <NSObject>

- (NSData *) decode: (NSString *) text;

@end
