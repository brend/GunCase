//
//  GCMapParserScope.m
//  GunCase
//
//  Created by Philipp Brendel on 17.02.13.
//
//

#import "GCMapParserScope.h"

@implementation GCMapParserScope

+ (id) scopeWithName:(NSString *)name
{
    GCMapParserScope *scope = [[GCMapParserScope alloc] init];
    
    scope.name = name;
    
    return scope;
}

+ (id) scopeWithTarget:(id<GCMapParserScopeTarget>)target
                  name: (NSString *) name
{
    GCMapParserScope *scope = [[GCMapParserScope alloc] init];
    
    scope.target = target;
    scope.name = name;
    
    return scope;
}

- (void) setAttributes:(NSDictionary *)attrs
{
    [self.target setAttributes: attrs];
}

@end
