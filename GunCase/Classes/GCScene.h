//
//  GCScene.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCScene : NSObject

#pragma mark -
#pragma mark Updating the Scene
- (void) update;

#pragma mark -
#pragma mark Rendering the Scene
- (void) render;
@property float rotation;
@property NSSize scale;

@end
