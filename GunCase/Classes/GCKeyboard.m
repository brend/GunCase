//
//  GCKeyboard.m
//  GunCase
//
//  Created by Philipp Brendel on 21.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCKeyboard.h"

@interface GCKeyboard ()
@property (nonatomic, strong) NSMutableSet *keyStates;
@end

@implementation GCKeyboard

- (id)init
{
    self = [super init];
    if (self) {
        self.keyStates = [NSMutableSet set];
    }
    return self;
}

@synthesize keyStates = _keyStates;

- (BOOL) keyPressed: (ushort) keyCode
{
    return [self.keyStates containsObject: [NSNumber numberWithUnsignedShort: keyCode]];
}

- (NSArray *) pressedKeys
{
    return self.keyStates.allObjects;
}

- (void) clearKey: (ushort) keyCode
{
    [self.keyStates removeObject: [NSNumber numberWithUnsignedShort: keyCode]];
}

- (void) setKey: (ushort) keyCode
{
    [self.keyStates addObject: [NSNumber numberWithUnsignedShort: keyCode]];
}

- (void) keyDown: (NSEvent *) theEvent
{
    [self setKey: theEvent.keyCode];
}

- (void) keyUp: (NSEvent *) theEvent
{
    [self clearKey: theEvent.keyCode];
}

@end
