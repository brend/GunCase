//
//  GCGameView.h
//  GunCase
//
//  Created by Philipp Brendel on 26.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GCGameView : NSOpenGLView

- (void) drawScene: (NSRect) rect;
- (void) updateGame;

@end
