//
//  GCKeyboard.m
//  GunCase
//
//  Created by Philipp Brendel on 21.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import "GCKeyboard.h"

@interface GCKeyboard ()
@property (nonatomic, strong) NSMutableDictionary *keyStates;
@end

@implementation GCKeyboard

- (id)init
{
    self = [super init];
    if (self) {
        self.keyStates = [NSMutableDictionary dictionary];
    }
    return self;
}

@synthesize keyStates = _keyStates;

- (BOOL) keyPressed: (ushort) keyCode
{
    NSNumber *state =
        [self.keyStates objectForKey: [NSNumber numberWithUnsignedShort: keyCode]];
    
    return state.boolValue;
}

- (void) clearKey: (ushort) keyCode
{
    [self.keyStates setObject: [NSNumber numberWithBool: NO]
                       forKey: [NSNumber numberWithUnsignedShort: keyCode]];
}

- (void) keyDown: (NSEvent *) theEvent
{
    [self.keyStates setObject: [NSNumber numberWithBool: YES] 
                       forKey: [NSNumber numberWithUnsignedShort: theEvent.keyCode]];
}

- (void) keyUp: (NSEvent *) theEvent
{
    [self.keyStates setObject: [NSNumber numberWithBool: YES] 
                       forKey: [NSNumber numberWithUnsignedShort: theEvent.keyCode]];
}

@end
