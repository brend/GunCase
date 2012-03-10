//
//  GCDirector.h
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCScene.h"

@interface GCDirector : NSObject
{
	NSMutableArray *sceneStack;
}

+ (id) sharedDirector;

- (void) pushScene: (GCScene *) scene;
- (GCScene *) popScene;

@end
