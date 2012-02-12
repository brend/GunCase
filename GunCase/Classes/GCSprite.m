//
//  GCSprite.m
//  GunMan
//
//  Created by Philipp Brendel on 05.02.2012.
//  Copyright BrendCorp 2009-2012. All rights reserved.
//

#import "GCSprite.h"
#import <QuartzCore/QuartzCore.h>

// Sets up an array of values for the texture coordinates.
const GLfloat GCSpriteTexcoords[] = 
{
	0, 0,
	1, 0,
	0, 1,
	1, 1,
};

#pragma mark Private GCSprite interface
@interface GCSprite ()
- (id) initWithVertices: (GLfloat[]) theVertices
				texture: (GLuint) textureName
	 textureCoordinates: (GLfloat[]) textureCoordinates;

@property (nonatomic, readwrite, copy) NSString *imageName;
@property (readonly) GLuint textureID;
@end

#pragma mark GCSprite Implementation
@implementation GCSprite
@synthesize width, height, flip;
@synthesize imageName;

- (id) initWithImage: (NSImage *) anImage
{
	if (anImage == nil)
		@throw [NSException exceptionWithName: @"ArgumentNil" reason: @"Argument image must not be nil" userInfo: nil];
	
	self = [super init];
	
	if (self == nil)
		return nil;
	
	CGImageRef spriteImage = 
	[anImage CGImageForProposedRect: NULL 
							context: NULL 
							  hints: nil]; // TODO Prüfen, ob man hier was Sinnvolles für "referenceContext" übergeben kann
	GLubyte *spriteData = NULL;
	CGContextRef spriteContext = NULL;
	GLfloat width_2 = 0, height_2 = 0;
	
	// Get the width and height of the image
	width = (GLsizei) CGImageGetWidth(spriteImage);
	height = (GLsizei) CGImageGetHeight(spriteImage);
	// Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
	// you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
	if (!(GBIsPowerOf2(width) && GBIsPowerOf2(height))) {
		NSString *message = [NSString stringWithFormat: @"Image dimensions must be powers of two; found: %d, %d", width, height];
	
		@throw [NSException exceptionWithName: @"InvalidImageFormat" reason: message userInfo: nil];
	}
	
	// Compute width and height of the texture		
	width_2 = width * 0.5;
	height_2 = height * 0.5;
	
	spriteVertices[0] = -width_2;	spriteVertices[1] = -height_2;
	spriteVertices[2] =  width_2;	spriteVertices[3] = -height_2;
	spriteVertices[4] = -width_2;	spriteVertices[5] =  height_2;
	spriteVertices[6] =  width_2;	spriteVertices[7] =  height_2;
	
	memcpy(textureCoordinates, GCSpriteTexcoords, sizeof(GLfloat) * 8);
	
	// Sets up pointers and enables states needed for using vertex arrays and textures
	glVertexPointer(2, GL_FLOAT, 0, spriteVertices);
	glEnableClientState(GL_VERTEX_ARRAY);
	glTexCoordPointer(2, GL_FLOAT, 0, textureCoordinates);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);		
	
	if (spriteImage == nil) {
		@throw [NSException exceptionWithName: @"GMLoadImageException" reason: @"Could not load sprite image" userInfo: nil];
	}
	
	// Allocated memory needed for the bitmap context
	spriteData = (GLubyte *) malloc(width * height * 4);
	memset( spriteData, 0, width * height * 4);
	// Uses the bitmatp creation function provided by the Core Graphics framework. 
	spriteContext = CGBitmapContextCreate(spriteData, width, height, 8, width * 4, CGImageGetColorSpace(spriteImage), kCGImageAlphaPremultipliedLast);
	CGContextTranslateCTM (spriteContext, 0, height);
	CGContextScaleCTM (spriteContext, 1.0, -1.0);
	// After you create the context, you can draw the sprite image to the context.
	CGContextDrawImage(spriteContext, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), spriteImage);
	// You don't need the context at this point, so you need to release it to avoid memory leaks.
	CGContextRelease(spriteContext);
	
	// Use OpenGL ES to generate a name for the texture.
	glGenTextures(1, &texture);
	// Bind the texture name. 
	glBindTexture(GL_TEXTURE_2D, texture);
	// Speidfy a 2D texture image, provideing the a pointer to the image data in memory
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, spriteData);
	// Release the image data
	free(spriteData);
	
	// Set the texture parameters to use a minifying filter and a linear filer (weighted average)
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	
	self.imageName = anImage.name;
	
	return self;
}

+ (id) spriteWithImage: (NSImage *) image
{
	return [[GCSprite alloc] initWithImage: image];
}

//+ (id) spriteWithString: (NSString *) text
//				   font: (NSFont *) font
//				  color: (NSColor *) color
//{
//	CGRect screenRect = [[NSScreen mainScreen] frame];
//	CGSize exactSize = [text sizeWithFont: font constrainedToSize: CGSizeMake(screenRect.size.width * 0.75, screenRect.size.height) lineBreakMode: UILineBreakModeWordWrap];
//	CGSize textureSize = CGSizeMake(GMFindPowerOf2(exactSize.width), GMFindPowerOf2(exactSize.height));
//	UIImage *image = nil;
//	
//	UIGraphicsBeginImageContext(textureSize);
//	[color setFill];
//	[text drawInRect: CGRectMake(0, 0, textureSize.width, textureSize.height) withFont: font lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//	
//	image = UIGraphicsGetImageFromCurrentImageContext();
//	UIGraphicsEndImageContext();
//	
//	return [GCSprite spriteWithImage: image];
//}

- (id) initWithVertices: (GLfloat[]) theVertices
				texture: (GLuint) textureName
	 textureCoordinates: (GLfloat[]) theTexCoords
{
	if ((self = [super init])) {
		memcpy(spriteVertices, theVertices, sizeof(GLfloat) * 8);
		memcpy(textureCoordinates, theTexCoords, sizeof(GLfloat) * 8);
		
		// Sets up pointers and enables states needed for using vertex arrays and textures
		glVertexPointer(2, GL_FLOAT, 0, spriteVertices);
		glEnableClientState(GL_VERTEX_ARRAY);
		glTexCoordPointer(2, GL_FLOAT, 0, textureCoordinates);
		glEnableClientState(GL_TEXTURE_COORD_ARRAY);		
		
		// TODO Eigenen Textur-Namen mit 0 initialisieren oder sonstwie garantieren, daß die Textur erst freigegeben wird, wenn alle Sprites verschwunden sind
		texture = textureName;
	}
	
	return self;
}

+ (NSArray *) spritesWithSheet: (NSImage *) sheetImage
						 width: (float) sheetWidth
						height: (float) sheetHeight
					   columns: (NSInteger) sheetColumns
						  rows: (NSInteger) sheetRows
{
	NSInteger spriteCount = sheetColumns * sheetRows;
	NSMutableArray *sprites = [NSMutableArray arrayWithCapacity: spriteCount];
	GCSprite *sheetSprite = [GCSprite spriteWithImage: sheetImage];
	
	GLfloat spriteWidth = sheetWidth / sheetColumns, spriteHeight = sheetHeight / sheetRows;
	GLfloat halfSpriteWidth = 0.5 * spriteWidth, halfSpriteHeight = 0.5 * spriteHeight;
	GLfloat spriteVertices[] = 
	{
		-halfSpriteWidth, -halfSpriteHeight,
		 halfSpriteWidth, -halfSpriteHeight,
		-halfSpriteWidth,  halfSpriteHeight,
		 halfSpriteWidth,  halfSpriteHeight
	};
	GLfloat fullWidth = sheetImage.size.width, fullHeight = sheetImage.size.height;
	
	for (NSInteger y = 0; y < sheetRows; ++y) {
		for (NSInteger x = 0; x < sheetColumns; ++x) {
			GLfloat texCoords[] = {
									x * spriteWidth / fullWidth,		y * spriteHeight / fullHeight,
									(x+1) * spriteWidth / fullWidth,	y * spriteHeight / fullHeight,
									x * spriteWidth / fullWidth,		(y+1) * spriteHeight / fullHeight,
									(x+1) * spriteWidth / fullWidth,	(y+1) * spriteHeight / fullHeight
								  };
			GCSprite *sprite = [[GCSprite alloc] initWithVertices: spriteVertices texture: sheetSprite.textureID textureCoordinates: texCoords];
			
			sprite.imageName = [sheetImage name];
			
			[sprites addObject: sprite];
		}
	}
	
	return sprites;
}

/* Commented out because
 *  1) doesn't belong here
 *  2) may be useful again some day (yeah, right)
 */
//+ (NSImage *) createThumbnailFromImage: (NSImage *) image
//						 withRectangle: (NSRect) rect
//{
//	NSSize size = NSMakeSize(32, 32);
//	NSImage *thumbnail = [[NSImage alloc] initWithSize: size];
//	
//	[thumbnail lockFocus];
//	[image drawInRect: NSMakeRect(0, 0, size.width, size.height) fromRect: rect operation: NSCompositeSourceOver fraction: 1];
//	[thumbnail unlockFocus];
//	
//	return thumbnail;
//}

- (void) dealloc
{
	// TODO Muss hier etwas zur Freigabe der Textur getan werden?
	self.imageName = nil;
}

- (GLuint) textureID
{
	return texture;
}

#pragma mark -
#pragma mark Drawing the Sprite

- (void) draw
{	
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
		
	glColor4f(1, 1, 1, 1);
	glBindTexture(GL_TEXTURE_2D, texture);
	glVertexPointer(2, GL_FLOAT, 0, spriteVertices);
	glTexCoordPointer(2, GL_FLOAT, 0, textureCoordinates);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

	// NOTE Zwecks Leistungssteigerung deaktiviert
//	glDisableClientState(GL_VERTEX_ARRAY);
//	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
//	glDisable(GL_TEXTURE_2D);
}

- (void) drawAtX: (float) x y: (float) y
{
	glTranslatef(x, y, 0);
	[self draw];
}

- (void) drawTest
{
	glScalef(-1, 1, 1);
	[self draw];
}

- (void) drawAtX: (float) x
			   y: (float) y
		rotation: (float) angle
		   scale: (NSSize) scale
{	
	glPushMatrix();
	
	glTranslatef(x, y, 0);
	glRotatef(angle, 0, 0, 1);
	glScalef(scale.width, scale.height, 1);
	
	[self draw];
	
	glPopMatrix();
}

@end
