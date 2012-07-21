//
//  GCKeyboard.h
//  GunCase
//
//  Created by Philipp Brendel on 21.07.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCKeyboard : NSObject

- (BOOL) keyPressed: (ushort) keyCode;
- (void) clearKey: (ushort) keyCode;

- (void) keyDown: (NSEvent *) theEvent;
- (void) keyUp: (NSEvent *) theEvent;

@end
