//
//  GCFont.m
//  GunCase
//
//  Created by Philipp Brendel on 15.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCFont.h"
#import "GCSprite.h"
#import "GCSpriteActor.h"
#import "GCCompositeActor.h"

@interface GCFont ()
@property (nonatomic, strong) NSArray *spriteSheet;
@property (nonatomic) NSInteger columns, rows;
- (GCActor *) createGlyphWithCharacter: (unichar) c x: (float) x y: (float) y;
- (void) drawCharacterWrappedString: (NSString *) aString
                             inRect: (NSRect) bounds;
- (void) drawWordWrappedString: (NSString *) aString
                        inRect: (NSRect) bounds;
@end

@implementation GCFont

#pragma mark -
#pragma mark Initialization

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
        self.characterHeight = image.size.height / rows;
	}
	
	return self;
}

#pragma mark -
#pragma mark Font Properties

@synthesize
	spriteSheet = _spriteSheet, 
	columns = _columns, 
	rows = _rows,
	characterWidth = _characterWidth,
    characterHeight = _characterHeight;

#pragma mark -
#pragma mark Drawing Strings

- (void) drawString: (NSString *) aString
             inRect: (NSRect) bounds
            options: (GCStringRenderOptions) options
{
    if (options & GCStringRenderWordWrap) {
        [self drawWordWrappedString: aString inRect: bounds];
    } else {
        [self drawCharacterWrappedString: aString inRect: bounds];
    }
}

- (void) drawCharacterWrappedString: (NSString *) aString
                             inRect: (NSRect) bounds
{
    float
        leftEdge = bounds.origin.x, 
        rightEdge = bounds.origin.x + bounds.size.width,
        topEdge = bounds.origin.y + bounds.size.height,
        bottomEdge = bounds.origin.y;
	float x = leftEdge, y = topEdge;
	
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
        
        if ((x + self.characterWidth) > rightEdge) {
            x = leftEdge;
            y -= self.characterHeight;
        }
        
        if ((y - self.characterHeight) < bottomEdge)
            break;
	}
}

- (void) drawWordWrappedString: (NSString *) aString
                        inRect: (NSRect) bounds
{
    GCActor *t = [self thingWithWordWrappedString: aString inRect: bounds];
    
    [t render];
}

- (GCActor *) createGlyphWithCharacter: (unichar) c
                                     x: (float) x
                                     y: (float) y
{
    NSInteger
        fx = c % self.columns,
        fy = c / self.columns;
    GCSprite *characterSprite = [self.spriteSheet objectAtIndex: fx + fy * self.columns];
    GCSpriteActor *glyph = [[GCSpriteActor alloc] initWithSprite: characterSprite];
    
    glyph.position = [GCVector vectorWithX: x y: y];

    return glyph;
}

- (GCActor *) thingWithWordWrappedString: (NSString *) aString
                                  inRect: (NSRect) bounds
{
    float
        leftEdge = bounds.origin.x,
        rightEdge = bounds.origin.x + bounds.size.width,
        topEdge = bounds.origin.y + bounds.size.height,
        bottomEdge = bounds.origin.y;
	float
        x = leftEdge,
        y = topEdge;
    
    NSCharacterSet
        *whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet],
        *newlineCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSMutableArray
        *fixedCharacters = [NSMutableArray arrayWithCapacity: aString.length],
        *currentWord = [NSMutableArray array];
    NSInteger i = 0;
    
    while (i < aString.length) {
        unichar c = [aString characterAtIndex: i];
        
        NSAssert(c >= 0 && c < self.spriteSheet.count, @"Invalid character");
        
        if ([whitespaceAndNewlineCharacterSet characterIsMember: c]) {
            [fixedCharacters addObjectsFromArray: currentWord];
            [currentWord removeAllObjects];
            
            if ([newlineCharacterSet characterIsMember: c]) {
                // If c is a line break, move down and to the left
                x = leftEdge;
                y -= self.characterHeight;
            } else {
                // If it's space or similar, move to the right
                x += self.characterWidth;
            }
            
            ++i;
            
            continue;
        }
        
		GCActor *glyph = [self createGlyphWithCharacter: c x: x y: y];
        
        [currentWord addObject: glyph];
        
        if (x > rightEdge) {
            float gx = leftEdge, gy = y - self.characterHeight;
            
            for (GCActor *g in currentWord) {
                g.position = [GCVector vectorWithX: gx y: gy];
                gx += self.characterWidth;
                // TODO Don't let characters step over the right edge (in case the word itself is wider than the allowed width)
                // TODO Divergenz, falls Wort zu breit?
            }
            
            x = gx;
            y = gy;
        } else {
            x += self.characterWidth;
        }
        
        // This was "(y - self.characterHeight) < bottomEdge" - why?
        if (y < bottomEdge)
            break;
        
        ++i;
    }
    
    [fixedCharacters addObjectsFromArray: currentWord];
    
    GCCompositeActor *t = [[GCCompositeActor alloc] init];
    
    [t addComponentsFromArray: fixedCharacters];
    
    return t;
}

@end
