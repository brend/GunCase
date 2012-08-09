//
//  NSData+Base64.h
//  Base64Decoder
//
//  Created by Philipp Brendel on 13.08.12.
//  Copyright (c) 2012 Philipp Brendel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)
+ (NSData *)decodeBase64WithString:(NSString *)strBase64;
@end
