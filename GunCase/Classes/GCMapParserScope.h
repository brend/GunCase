//
//  GCMapParserScope.h
//  GunCase
//
//  Created by Philipp Brendel on 17.02.13.
//
//

#import <Foundation/Foundation.h>
#import "GCMapParserScopeTarget.h"

@interface GCMapParserScope : NSObject

+ (id) scopeWithName: (NSString *) name;
+ (id) scopeWithTarget: (id<GCMapParserScopeTarget>) target
                  name: (NSString *) name;

@property (nonatomic, strong) id<GCMapParserScopeTarget> target;
@property (nonatomic, copy) NSString *name;

- (void) setAttributes: (NSDictionary *) attrs;

@end
