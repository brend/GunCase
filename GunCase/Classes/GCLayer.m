//
//  GCLayer.m
//  GunCase
//
//  Created by Philipp Brendel on 09.04.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCLayer.h"
#import <QuartzCore/QuartzCore.h>

@implementation GCLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.name = [self description];
        self.keyboard = [[GCKeyboard alloc] init];
    }
    return self;
}

#pragma mark -
#pragma mark Layer Identity
@synthesize name = _name;

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
