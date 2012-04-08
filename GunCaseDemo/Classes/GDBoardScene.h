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

@interface GDBoardScene : GCScene
{
	GCSprite *boardSprite, *currentPlayerLabelSprite, *winnerLabelSprite;
	
	GDToken *board[9];
	NSSize fieldSize;
	
	GDMarker *marker;
	GDToken *currentToken;
	
	GCAnimation *rotationAnimation;
}

@end
