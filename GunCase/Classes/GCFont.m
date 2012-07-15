//
//  GCFont.m
//  GunCase
//
//  Created by Philipp Brendel on 15.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCFont.h"
#import "GCSprite.h"

@interface GCFont ()
@property (nonatomic, strong) NSArray *spriteSheet;
@property (nonatomic) NSInteger columns, rows;
@end

@implementation GCFont

- (id) initWithImage: (NSImage *) image
			 columns: (NSInteger) cols
				rows: (NSInteger) rows
{
	self = [super init];
	
	if (self) {
		NSArray *sheet = 
			[GCSprite spritesWithSheet: image 
								 width: image.size.width 
								height: image.size.height 
							   columns: cols
								  rows: rows];
		
		self.columns = cols;
		self.rows = rows;
		self.spriteSheet = sheet;
		self.characterWidth = image.size.width / cols;
	}
	
	return self;
}

@synthesize
	spriteSheet = _spriteSheet, 
	columns = _columns, 
	rows = _rows,
	characterWidth = _characterWidth;

- (void) drawString: (NSString *) aString
		 atPosition: (GCVector *) position
{
	float x = position.x, y = position.y;
	
	for (NSInteger i = 0; i < aString.length; ++i) {
		unichar c = 
			[aString characterAtIndex: i];
		
		NSAssert(c >= 0 && c < self.spriteSheet.count, @"Invalid character");
		
		// Reversing the Y-Axis of the sprite map
		// TODO: Why do I have to do this? Why is the sprite sheet arranged that way?
		NSInteger 
			fx = c % self.columns, 
			fy = self.columns - (c / self.columns + 1);
		
		GCSprite *characterSprite = 
			[self.spriteSheet objectAtIndex: fx + fy * self.columns];
		
		[characterSprite drawAtX: x y: y];
		
		x += self.characterWidth;
	}
}

@end
