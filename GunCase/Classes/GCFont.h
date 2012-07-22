//
//  GCFont.h
//  GunCase
//
//  Created by Philipp Brendel on 15.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCVector.h"

typedef enum {
    GCStringRenderNoOptions = 0,
    GCStringRenderWordWrap = 1 << 0
} GCStringRenderOptions;

@interface GCFont : NSObject

- (id) initWithImage: (NSImage *) image
			 columns: (NSInteger) cols
				rows: (NSInteger) rows;

- (void) drawString: (NSString *) aString
             inRect: (NSRect) bounds
            options: (GCStringRenderOptions) options;

@property (nonatomic) float characterWidth, characterHeight;

@end
