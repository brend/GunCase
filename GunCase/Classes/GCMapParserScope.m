//
//  GCMapParserScope.m
//  GunCase
//
//  Created by Philipp Brendel on 17.02.13.
//
//

#import "GCMapParserScope.h"

@interface GCMapParserScope ()
@property (nonatomic, weak) id<GCMapParserScopeTarget> target;
@property (nonatomic, copy) NSString *name;
@end

@implementation GCMapParserScope

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
