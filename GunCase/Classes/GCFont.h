//
//  GCFont.h
//  GunCase
//
//  Created by Philipp Brendel on 15.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCVector.h"

@interface GCFont : NSObject

- (id) initWithImage: (NSImage *) image
			 columns: (NSInteger) cols
				rows: (NSInteger) rows;

- (void) drawString: (NSString *) aString
		 atPosition: (GCVector *) position;

@property (nonatomic) float characterWidth;

@end
