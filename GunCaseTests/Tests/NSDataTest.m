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

- (void) testDecodeBase64WithString
{
    NSString *encoded = @"SGVsbG8gd29ybGQ=";
    NSData *decoded = [NSData decodeBase64WithString: encoded];
    NSString *output = [[NSString alloc] initWithData: decoded encoding: NSUTF8StringEncoding];
    NSString *expectedResult = @"Hello world";
    
    STAssertEqualObjects(output, expectedResult, @"Strings differ");
}

- (void) testDecodeBase64WithStringArgumentIsNil
{
    NSData *data = [NSData decodeBase64WithString:nil];
    
    STAssertNil(data, @"Result should be nil");
}

- (void) testDecodeBase64WithStringArgumentIsInvalid
{
    NSData *data = [NSData decodeBase64WithString:@"My hair is a bird!"];
    
    STAssertNil(data, @"Result should be nil");
}


@end
