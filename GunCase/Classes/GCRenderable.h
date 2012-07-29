//
//  GCRenderable.h
//  GunCase
//
//  Created by Philipp Brendel on 14.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GCRenderable <NSObject>
- (void) update;
- (void) render;
@end
