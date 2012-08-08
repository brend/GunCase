//
//  NSDataTest.m
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import "NSDataTest.h"
#import "NSData+Base64.h"

@implementation NSDataTest

- (void) testToString
{
    Byte bytes[] = { 'H', 'i' };
    NSData *data = [NSData dataWithBytes: bytes length: sizeof(bytes)];
    NSString *string = [data base64EncodedString];
    
    STAssertEqualObjects(@"SGk=", string, @"Base64-encoded string is incorrect");
}

- (void) testFromString
{
    NSData *data = [NSData dataFromBase64String: @"SGk="];
    NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    STAssertEqualObjects(@"Hi", string, @"Base64-decoded string is incorrect");
}


@end
