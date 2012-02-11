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
	GLuint texture[1];
	GLfloat spriteVertices[8];
	GLfloat textureCoordinates[8];
	
	NSInteger widthInPixels, heightInPixels;
	float widthInWorld, heightInWorld;
	
	NSString *imageName;
	NSImage *thumbnail;
}

#pragma mark -
#pragma mark Initialization
- (id) initWithImage: (NSImage *) image;
- (id) initWithImageNamed: (NSString *) imageName;
+ (id) spriteWithImage: (NSImage *) image;
+ (id) spriteWithImageNamed: (NSString *) imageName;
//+ (id) spriteWithString: (NSString *) text
//				   font: (NSFont *) font
//				  color: (NSColor *) color;

+ (NSArray *) spritesWithSheet: (NSImage *) anImage
						 width: (float) sheetWidth
						height: (float) sheetHeight
					   columns: (NSInteger) sheetColumns
						  rows: (NSInteger) sheetRows
			  createThumbnails: (BOOL) thumbnails;

+ (NSImage *) createThumbnailFromImage: (NSImage *) image
						 withRectangle: (NSRect) rect;

#pragma mark -
#pragma mark Sprite Dimensions
@property (nonatomic, readonly) NSInteger widthInPixels, heightInPixels;
@property (nonatomic, readonly) float widthInWorld, heightInWorld;

@property (nonatomic, readonly, copy) NSString *imageName;

#pragma mark -
#pragma mark Thumbnail
@property (nonatomic, retain) NSImage *thumbnail;

#pragma mark -
#pragma mark Drawing the Sprite
- (void) draw;
- (void) drawAtX: (float) x y: (float) y;
- (void) drawAtX: (float) x
			   y: (float) y
		rotation: (float) angle;
- (void) drawAtX: (float) x
			   y: (float) y
		   scale: (NSSize) scale;
- (void) drawTest;

// DEBUG
- (void) drawStatusBars: (NSSize) worldSize;

@end
