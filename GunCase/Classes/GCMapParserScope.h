//
//  GCMapParserScope.h
//  GunCase
//
//  Created by Philipp Brendel on 17.02.13.
//
//

#import <Foundation/Foundation.h>

@protocol GCMapParserScopeTarget <NSObject>
- (void) setAttributes: (NSDictionary *) attrs;
@end

@interface GCMapParserScope : NSObject

+ (id) scopeWithTarget: (id<GCMapParserScopeTarget>) target
                  name: (NSString *) name;

@property (readonly, weak) id<GCMapParserScopeTarget> target;
@property (readonly, copy) NSString *name;

- (void) setAttributes: (NSDictionary *) attrs;

@end
