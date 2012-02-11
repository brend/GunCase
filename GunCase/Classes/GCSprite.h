//
//  GCSprite.h
//  GunMan
//
//  Created by Philipp Brendel on 05.02.2012.
//  Copyright BrendCorp 2009-2012. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GCSprite : NSObject
{
	GLuint texture;
	GLfloat spriteVertices[8];
	GLfloat textureCoordinates[8];
	
	GLsizei width, height;
	
	NSString *imageName;
}

#pragma mark -
#pragma mark Initialization
- (id) initWithImage: (NSImage *) image;
+ (id) spriteWithImage: (NSImage *) image;
//+ (id) spriteWithString: (NSString *) text
//				   font: (NSFont *) font
//				  color: (NSColor *) color;

+ (NSArray *) spritesWithSheet: (NSImage *) anImage
						 width: (float) sheetWidth
						height: (float) sheetHeight
					   columns: (NSInteger) sheetColumns
						  rows: (NSInteger) sheetRows;

#pragma mark -
#pragma mark Sprite Dimensions
@property (nonatomic, readonly) GLsizei width, height;

@property (nonatomic, readonly, copy) NSString *imageName;

#pragma mark -
#pragma mark Drawing the Sprite
- (void) drawAtX: (float) x y: (float) y;
- (void) drawAtX: (float) x
			   y: (float) y
		rotation: (float) angle;
- (void) drawAtX: (float) x
			   y: (float) y
		   scale: (NSSize) scale;
- (void) drawAtX: (float) x
			   y: (float) y
		rotation: (float) angle
		   scale: (NSSize) scale;

- (void) drawTest;

// DEBUG
- (void) drawStatusBars: (NSSize) worldSize;

@end
