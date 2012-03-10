//
//  NSMutableArray+GCStack.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (GCStack)

- (void) push: (id) anObject;
- (id) pop;

@end
