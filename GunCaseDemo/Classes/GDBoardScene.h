//
//  GDBoardScene.h
//  GunCase
//
//  Created by Philipp Brendel on 25.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCScene.h"
#import "GunCase.h"
#import "GDMarker.h"
#import "GDToken.h"

@interface GDBoardScene : GCLayeredScene
{
	GCSprite *currentPlayerLabelSprite, *winnerLabelSprite;
	
	NSMutableArray *board;
	NSSize fieldSize;
	
	GDMarker *marker;
	GDToken *currentToken;
	
	GCAnimation *rotationAnimation;
}

@end
