//
//  GCScene.m
//  GunCase
//
//  Created by Philipp Brendel on 03.03.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCScene.h"
#import <QuartzCore/QuartzCore.h>

@implementation GCScene

- (id)init
{
    self = [super init];
    if (self) {
        self.keyboard = [[GCKeyboard alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark Handling User Input
@synthesize keyboard = _keyboard;

- (void) mouseDown: (NSEvent *) theEvent
{
    
}

- (void)mouseUp:(NSEvent *)theEvent
{
    
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    
}

@end
