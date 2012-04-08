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

typedef enum {
	TokenNone = 0,
	TokenX = 1,
	TokenO = 2
} Token;

@interface GDBoardScene : GCScene
{
	GCSprite *boardSprite, *currentPlayerLabelSprite, *winnerLabelSprite;
	GCSprite *tokenSprites[3];
	
	Token board[9];
	NSSize fieldSize;
	
	GDMarker *marker;
	Token currentToken;
}

@end
