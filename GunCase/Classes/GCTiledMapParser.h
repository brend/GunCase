//
//  GCTiledMapParser.h
//  GunCase
//
//  Created by Philipp Brendel on 08.08.12.
//
//

#import "GCMapParser.h"

@interface GCTiledMapParser : GCMapParser <NSXMLParserDelegate>

- (id) initWithURL: (NSURL *) url;

@end
