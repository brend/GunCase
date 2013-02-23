//
//  GCMapParserScopeTest.m
//  GunCase
//
//  Created by Philipp Brendel on 17.02.13.
//
//

#import "GCMapParserScopeTest.h"
#import "GCMapParserScope.h"
#import <OCMock/OCMock.h>

@implementation GCMapParserScopeTest

- (void) testCreation
{
    id target = [OCMockObject mockForProtocol: @protocol(GCMapParserScopeTarget)];
    NSString *name = @"Flubidu";
    GCMapParserScope *scope =
        [GCMapParserScope scopeWithTarget: target name: name];
    
    STAssertEqualObjects(scope.target, target, @"targets not equal");
    STAssertEqualObjects(scope.name, name, @"names not equal");
}

- (void) testSetProperties
{
    id target = [OCMockObject mockForProtocol: @protocol(GCMapParserScopeTarget)];
    NSString *name = @"Flubidu";
    GCMapParserScope *scope =
        [GCMapParserScope scopeWithTarget: target name: name];
    NSDictionary *props = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"object1", @"key1",
                           @"object2", @"key2",
                           nil];
    
    [(id<GCMapParserScopeTarget>) [target expect] setAttributes: props];
    
    [scope setAttributes: props];
    
    [target verify];
}

@end
