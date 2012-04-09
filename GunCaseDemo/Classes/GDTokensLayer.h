//
//  GDTokensLayer.h
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayer.h"
#import "GDToken.h"

@interface GDTokensLayer : GCLayer
{
	NSArray *board;
}

- (id) initWithBoard: (NSArray *) board;

@end
