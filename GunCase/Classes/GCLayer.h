//
//  GCLayer.h
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCLayer : NSObject

#pragma mark -
#pragma mark Updating the Layer
- (void) update;

#pragma mark -
#pragma mark Rendering the Layer
- (void) render;
@property float rotation;
@property NSSize scale;

@end
