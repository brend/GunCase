//
//  GCDirector.m
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCDirector.h"

@implementation GCDirector

static NSMutableArray *GCDirectorSceneStack = nil;

- (id)init
{
    self = [super init];
    if (self) {
        sceneStack = GCDirectorSceneStack;
    }
    return self;
}

+ (void) initialize
{
	GCDirectorSceneStack = [NSMutableArray array];
}

+ (id) sharedDirector
{
	return [[GCDirector alloc] init];
}

- (void) pushScene: (GCScene *) scene
{
	[sceneStack push: scene];
}

- (GCScene *) popScene
{
	return sceneStack.pop;
}

@end
