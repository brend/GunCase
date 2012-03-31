//
//  GCStack.h
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCStack : NSObject
{
	NSMutableArray *items;
}

- (void) push: (id) anObject;
- (id) peek;
- (id) pop;
- (BOOL) empty;

@end
