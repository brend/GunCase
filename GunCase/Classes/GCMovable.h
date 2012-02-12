//
//  GCMovable.h
//  GunCase
//
//  Created by Philipp Brendel on 11.02.12.
//  Copyright (c) 2012 BrendCorp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GCMovable <NSObject>

@property NSPoint position;
@property float rotation;
@property NSSize scale;

@end
